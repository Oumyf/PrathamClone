# Building ReadNet — A Flutter Dev Log

*Everything I built, how it works, and what I learned along the way.*

---

## The context

ReadNet is a mobile app used in Senegal to assess children's reading skills, following the ASER methodology (Annual Status of Education Report). There was already an Android version written in Java. My job: rebuild it in Flutter while learning as I go.

I didn't have deep Flutter experience at the start. This document walks through what I built, the technical decisions I made, and especially the bugs that taught me things.

---

## The stack and why

**Flutter + Dart.** One codebase for Android (and iOS later if needed). Dart is a typed language, close to Java or TypeScript, so not too disorienting.

**Riverpod** for state management. There's also Provider, Bloc, GetX — I went with Riverpod because it forces you to be explicit about what's shared across the app. A Riverpod `Provider` is a global object any widget can access without threading it through constructors.

**Drift** for the local database. Drift is an ORM on top of SQLite. The idea: you describe your tables in Dart, run a command, and it generates all the query code automatically. Much cleaner than writing raw SQL strings.

**go_router** for navigation. Flutter has built-in navigation but it gets messy the moment you want named routes or to pass data between screens. go_router works like React Router.

**Dio** for HTTP. The Dart equivalent of Retrofit or Axios. Handles timeouts, headers, multipart uploads.

**record** for audio recording. The child reads aloud, the assessor records. Simple.

**archive** for ZIP creation. We package audio recordings + a JSON file into a ZIP before sending to the server.

---

## Project structure

I organized by feature, not by file type. "Feature-first":

```
lib/
├── core/           → theme, routes, API constants
├── data/
│   ├── database/   → Drift tables + AppDatabase + provider
│   ├── models/     → models for API responses
│   └── services/   → network logic (pull data, sync upload)
├── features/
│   ├── auth/       → login screen
│   ├── home/       → main screen (3 tabs)
│   ├── assessment/ → assessment flow
│   └── pull_crl/   → first launch, data download
└── shared/
    └── widgets/    → reusable components
```

Why? When I need "everything about the assessment," I go to `features/assessment/`. I don't have to jump between `screens/`, `controllers/`, `models/` in separate top-level folders.

---

## The database with Drift

### How Drift works

You create a class per table that extends `Table`:

```dart
class AserToolTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();
  TextColumn get type => text()();
  TextColumn get language => text()();
  IntColumn get sampleNumber => integer().withDefault(const Constant(1))();
  BoolColumn get isAttempted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
```

Then you run `flutter pub run build_runner build` and Drift generates a `.g.dart` file with all the query logic. You never write SQL.

To query the database:

```dart
Future<List<AserToolTableData>> getAserToolItems(
    String type, String language, int limit) {
  return (select(aserToolTable)
        ..where((t) =>
            t.type.equals(type) &
            t.language.equals(language) &
            t.isAttempted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.sampleNumber)])
        ..limit(limit))
      .get();
}
```

It looks like SQL but it's pure Dart. The compiler checks the types.

### Migrations

When you add a table after the app is already installed, SQLite doesn't create it automatically. You manage migrations:

```dart
@override
int get schemaVersion => 8;

@override
MigrationStrategy get migration => MigrationStrategy(
      onCreate: (m) => m.createAll(), // first install
      onUpgrade: (m, from, to) async {
        if (from < 2) await m.createTable(municipalityTable);
        if (from < 3) await m.createTable(instituteTable);
        // ...
      },
    );
```

Every time you add a table, bump `schemaVersion` and add a condition. If someone upgrades from version 3 to version 8, all conditions between 3 and 8 run in order.

### The Riverpod provider for the database

So any screen can access the database, we create a provider:

```dart
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
```

`ref.onDispose` closes the connection cleanly when the provider is destroyed. In widgets, we access it with `ref.read(databaseProvider)`.

---

## Navigation with go_router

go_router works with named routes like URLs:

```dart
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    GoRoute(
      path: '/assessment/child',
      builder: (context, state) => SelectChildScreen(
        schoolId: state.extra as String,
      ),
    ),
  ],
);
```

To navigate while passing data:

```dart
context.push('/assessment/child', extra: schoolId);
```

`state.extra` retrieves what you passed. The `as String` is a cast — if you pass something other than a String, you'll get a runtime error. Fine for simple data like IDs.

The difference between `context.go()` and `context.push()`: `go()` replaces the whole navigation stack (like a redirect), `push()` adds on top (like opening a new page).

---

## Authentication

The login screen checks credentials against the local `CrlTable`:

```dart
Future<void> _onLogin() async {
  final db = ref.read(databaseProvider);
  final crl = await db.checkCredentials(username, password);

  if (crl != null) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('crlId', crl.crlId);
    await prefs.setString('crlName', '${crl.firstName} ${crl.lastName ?? ''}');
    context.go('/home');
  } else {
    _showError('Identifiants incorrects.');
  }
}
```

**SharedPreferences** is persistent key-value storage. We save the logged-in user's ID there so we remember the session without reopening the database every time.

### The shake animation

When credentials are wrong, the card shakes. This uses an `AnimationController` and `math.sin()`:

```dart
_shakeController = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 500),
);

// In build:
final offset = math.sin(_shakeAnimation.value * math.pi * 4) * 8;
return Transform.translate(offset: Offset(offset, 0), child: child);
```

`math.sin()` produces an oscillation between -1 and 1. Multiply by 8 to get pixels. The `* 4` speeds up the cycles so you get 4 back-and-forths in 500ms.

---

## The initial data download

Before working, the assessor needs to download from the server: their account, municipalities, institutions, schools, children, and test items.

`PullCrlService` makes all these API calls with Dio:

```dart
final response = await _dio.get(ApiConstants.getAserSamples);
final List data = response.data['data'];
```

`response.data` contains the Dart object already parsed from JSON. Dio handles deserialization.

Each item is inserted with `insertOnConflictUpdate` — if the item already exists, it's updated; otherwise created. This is the SQLite `UPSERT`.

### A bug that cost me time

The API returns the type `"Non-word"` with a lowercase `w`. I had coded `"Non-Word"` with an uppercase `W`. Result: zero items loaded for that level, with no error. This kind of bug is invisible because it doesn't crash — it just returns an empty list.

The lesson: always check raw API data with curl or Postman before writing code that consumes it.

---

## The assessment flow

Navigation flow to start an assessment:

```
Municipality → Institution → School → Child → Test
```

Each screen receives the parent level's ID via `state.extra` and loads its data from the local database.

### Child selection and session creation

On the child selection screen, you pick the test language (Wolof, Peulh, Serere) and create a session:

```dart
final examId = '${crlId}_${student.studentId}_${DateTime.now().millisecondsSinceEpoch}';

await db.insertSession(StudentSessionTableCompanion(
  examId: Value(examId),
  studId: Value(student.studentId),
  crlId: Value(crlId),
  childFullName: Value(student.studentName),
  language: Value(selectedLanguage),
  startTime: Value(DateTime.now().toIso8601String()),
));

await prefs.setString('currentLevel', 'Letter');
context.push('/assessment/test', extra: examId);
```

The `examId` is a unique key: CRL ID + child ID + timestamp. We save it to the database and pass it to the test screen.

---

## The test screen

The most complex screen. It handles 4 levels in order:

```dart
const _levelOrder = ['Letter', 'Word', 'Non-word', 'Passage'];
const _levelLimits = {'Letter': 9, 'Word': 11, 'Non-word': 11, 'Passage': 1};
```

For each level, we load items from the database, display them one at a time, the assessor records the child's reading, then grades the response.

### The grading system

Three possible values:
- `2` → correct
- `1` → wrong
- `9` → no answer

In the database we store `-1` as the initial value (not attempted). When we retrieve responses to calculate the score, we filter on `isAttempted = true`.

### Audio recording

```dart
final recorder = Record();

Future<void> _startRecording(String path) async {
  await recorder.start(path: path, encoder: AudioEncoder.aacLc);
}

Future<void> _stopRecording() async {
  await recorder.stop();
}
```

Audio file path: `{documentsDir}/{examId}/{examId}_{itemId}.m4a`

We save this path in the database with the response. Later, when building the ZIP for upload, we find the file by its path.

### A plugin that wouldn't work

After adding `record` to `pubspec.yaml`, I was getting `MissingPluginException` on launch. The native Android plugin wasn't registered.

Fix: completely uninstall the app from the phone and reinstall it. Flutter doesn't always do a full reinstall during hot reload or even a regular `flutter run` if the app was already installed.

```bash
adb uninstall com.baamtu.pratham_clone
flutter run
```

### Progressing between levels

When all items in a level are handled, we move to the next. The `_nextLevel()` method reloads items for the next level from the database and resets the current index. If we're on the last level, we close the session.

---

## Syncing with the server

### Building the ZIP

For each session to send, we create a ZIP containing:
- A JSON file with session metadata and all responses
- The M4A audio files for each recording

```dart
final encoder = ZipEncoder();
final archive = Archive();

final jsonBytes = utf8.encode(jsonEncode(sessionJson));
archive.addFile(
  ArchiveFile('$examId/${examId}INFO.json', jsonBytes.length, jsonBytes),
);

for (final answer in answers) {
  final audioFile = File(answer.recordingName!);
  if (!await audioFile.exists()) continue;
  final audioBytes = await audioFile.readAsBytes();
  final filename = audioFile.path.split('/').last;
  archive.addFile(
    ArchiveFile('$examId/$filename', audioBytes.length, audioBytes),
  );
}

return encoder.encode(archive)!;
```

### Multipart upload

The ZIP is sent as a file in a multipart form:

```dart
final formData = FormData.fromMap({
  'zipfile': await MultipartFile.fromFile(
    zipFile.path,
    filename: '${session.examId}.zip',
  ),
});

final response = await _dio.post(ApiConstants.pushZipFiles, data: formData);
```

If the server responds with `status: 'success'`, we mark the session as pushed in the database so we don't resend it.

---

## UI design

### The global theme

The whole theme lives in `lib/core/theme.dart`. Colors:

```dart
class AppColors {
  static const primary = Color(0xFF0362A0);
  static const error = Color(0xFFD0021B);
  static const textDark = Color(0xFF292929);
  // ...
}
```

And the `ThemeData` with default styles for buttons, text fields, cards. The advantage: change the primary color in one place and it propagates everywhere.

### The login screen background

A `Stack` with multiple layers:
1. A `Container` with `LinearGradient` (dark blue to light blue)
2. `Container` circles positioned with `Positioned` for decoration
3. A `CustomPainter` drawing a grid of small dots

`CustomPainter` is how you draw freely on the canvas in Flutter. Implement the `paint(Canvas canvas, Size size)` method.

### Animated input fields

Each text field is wrapped in an `AnimatedContainer` that changes border and background color on focus:

```dart
Focus(
  onFocusChange: (focused) => setState(() => _isFocused = focused),
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    decoration: BoxDecoration(
      border: Border.all(
        color: _isFocused ? AppColors.primary : AppColors.border,
        width: _isFocused ? 2 : 1.5,
      ),
    ),
    child: TextField(...),
  ),
)
```

`AnimatedContainer` automatically interpolates between decoration values when they change. No `AnimationController` needed.

### Gradient text

For the "ReadNet" title with a color gradient:

```dart
ShaderMask(
  shaderCallback: (bounds) => const LinearGradient(
    colors: [Color(0xFF0362A0), Color(0xFF0484D8)],
  ).createShader(bounds),
  child: Text(
    'ReadNet',
    style: TextStyle(color: Colors.white), // white is replaced by the shader
  ),
)
```

`ShaderMask` applies a graphical shader over its child. The `Colors.white` on the text acts as a "mask" — the shader replaces white with the gradient.

---

## The bugs worth remembering

**Incompatible `record` version.** Version 5.x of the `record` package had broken its API on Linux. Downgraded to 4.4.4 and changed `AudioRecorder()` to `Record()`.

**Only one item displayed per level.** The Drift query had a leftover `sampleNumber.equals(1)` filter from an old logic path. It was always returning just the first item instead of all items. Removed the filter, added a `limit` parameter.

**Login screen overflow.** The "Première utilisation ? S'enregistrer" text was overflowing its container. Fixed with `width: double.infinity` on the container + `Flexible` + `TextOverflow.ellipsis` on the text.

**`path_provider` declared twice in `pubspec.yaml`.** The `record` package already includes it as a dependency. Declaring both caused a version conflict. Removed the duplicate line.

---

## What I'd take from this

Flutter isn't hard but it has its own logic. The things that took me the most time to understand:

**Widgets are immutable.** A `StatelessWidget` can't change after it's created. For changing state, use `StatefulWidget` with `setState()`. For state shared across multiple screens, use Riverpod.

**build_runner is mandatory for Drift.** Every table modification requires rerunning `flutter pub run build_runner build`. If you forget, the compiled code no longer matches your defined tables.

**Hot reload doesn't reinstall native plugins.** When you add a package with native Android code (like `record`), you need to completely uninstall and reinstall the app.

**API types are contracts.** If the API returns `"Non-word"` and you coded `"Non-Word"`, zero results with no error. Always check raw data first.

---

*Project: ReadNet Flutter — Senegal 2024*
