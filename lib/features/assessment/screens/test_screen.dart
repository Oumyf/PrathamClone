import 'dart:io';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:record/record.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Ordre des niveaux du test — types exacts retournés par l'API
const _levelOrder = ['Letter', 'Word', 'Non-word', 'Passage'];

// Limite d'items à afficher par niveau
const _levelLimits = {
  'Letter': 9,
  'Word': 11,
  'Non-word': 11,
  'Passage': 1,
};

// Noms affichés en français
const _levelNames = {
  'Letter': 'Lettres',
  'Word': 'Mots',
  'Non-word': 'Non-Mots',
  'Passage': 'Passage',
};

class TestScreen extends ConsumerStatefulWidget {
  final String examId;

  const TestScreen({super.key, required this.examId});

  @override
  ConsumerState<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  String _level = 'Letter';
  String _language = '';
  int _sampleNumber = 1;
  String _studentName = '';

  List<AserToolTableData> _items = [];
  final Map<String, int> _grades = {};
  bool _isLoading = true;
  int _currentIndex = 0; // item actuellement affiché

  // Audio
  final _recorder = Record();
  String? _recordingItemId;
  final Map<String, String> _recordingPaths = {};

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _level = prefs.getString('currentLevel') ?? 'Letter';
    _language = prefs.getString('currentLanguage') ?? '';
    _sampleNumber = prefs.getInt('currentSampleNumber') ?? 1;

    // Récupérer le nom de l'enfant depuis la session
    final db = ref.read(databaseProvider);
    final session = await db.getSession(widget.examId);
    _studentName = session?.childFullName ?? '';

    await _loadItems();
  }

  Future<void> _loadItems() async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    final db = ref.read(databaseProvider);
    final limit = _levelLimits[_level] ?? 9;

    var items = await db.getAserToolItems(_level, _language, limit);

    // Si pas assez d'items disponibles (déjà tous tentés), on remet à zéro et on recharge
    if (items.length < limit) {
      await db.resetAserToolAttempted(_level, _language);
      items = await db.getAserToolItems(_level, _language, limit);
    }

    if (!mounted) return;
    setState(() {
      _items = items;
      _currentIndex = 0;
      _grades.clear();
      for (final item in items) {
        _grades[item.id] = -1;
      }
      _isLoading = false;
    });
  }

  Future<void> _toggleRecording(String itemId) async {
    // Si on enregistre déjà cet item → arrêter
    if (_recordingItemId == itemId) {
      await _recorder.stop();
      setState(() => _recordingItemId = null);
      return;
    }

    // Si on enregistre un autre item → arrêter d'abord
    if (_recordingItemId != null) {
      await _recorder.stop();
    }

    // Vérifier la permission micro
    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Permission micro refusée', style: GoogleFonts.nunito()),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return;
    }

    // Créer le dossier et le fichier audio
    final dir = await getApplicationDocumentsDirectory();
    final folder = Directory('${dir.path}/${ widget.examId}');
    await folder.create(recursive: true);
    final path = '${folder.path}/${widget.examId}_$itemId.m4a';

    await _recorder.start(path: path, encoder: AudioEncoder.aacLc);

    setState(() {
      _recordingItemId = itemId;
      _recordingPaths[itemId] = path;
    });
  }

  void _setGrade(String itemId, int grade) {
    setState(() {
      // Si on appuie sur le même bouton déjà sélectionné → on remet à -1
      _grades[itemId] = _grades[itemId] == grade ? -1 : grade;
    });
  }

  // Combien d'items ont été notés (grade != -1)
  int get _gradedCount => _grades.values.where((g) => g != -1).length;

  bool get _isLastLevel => _level == _levelOrder.last;

  String get _nextLevel {
    final idx = _levelOrder.indexOf(_level);
    return idx < _levelOrder.length - 1 ? _levelOrder[idx + 1] : '';
  }

  // Sauvegarde les réponses dans la DB
  Future<void> _saveAnswers() async {
    final db = ref.read(databaseProvider);

    for (final item in _items) {
      final grade = _grades[item.id] ?? -1;
      await db.insertAserToolAnswer(AserToolAnswersTableCompanion(
        examId: Value(widget.examId),
        queId: Value(item.id),
        queText: Value(item.data),
        type: Value(_level),
        sampleNumber: Value(_sampleNumber),
        grade: Value(grade),
        isAttempted: Value(grade != -1),
        recordingName: Value(_recordingPaths[item.id]),
      ));
      // Marquer l'item comme utilisé dans AserToolTable
      await db.markAserToolAttempted(item.id);
    }
  }

  Future<void> _onNextLevel() async {
    // Demander confirmation avant de passer au niveau suivant
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          _isLastLevel ? 'Terminer le test ?' : 'Niveau suivant ?',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w800),
        ),
        content: Text(
          _isLastLevel
              ? 'Voulez-vous terminer et sauvegarder ce test ?'
              : 'Passer au niveau "${_levelNames[_nextLevel]}" ?',
          style: GoogleFonts.nunito(color: AppColors.textGrey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Annuler',
                style: GoogleFonts.nunito(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              _isLastLevel ? 'Terminer' : 'Continuer',
              style: GoogleFonts.nunito(),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await _saveAnswers();

    if (_isLastLevel) {
      await _completeTest();
    } else {
      // Mettre à jour le niveau courant dans les prefs
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentLevel', _nextLevel);

      if (!mounted) return;
      setState(() => _level = _nextLevel);
      await _loadItems();
    }
  }

  Future<void> _completeTest() async {
    final db = ref.read(databaseProvider);
    final now = DateTime.now().toIso8601String();

    // Mettre à jour la session avec l'heure de fin
    await db.updateSessionEnd(widget.examId, now, '-');

    if (!mounted) return;

    // Afficher l'écran de succès
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.success, size: 64),
            ),
            const Gap(16),
            Text('Test terminé !',
                style: GoogleFonts.nunito(
                    fontSize: 22, fontWeight: FontWeight.w800)),
            const Gap(8),
            Text(
              'L\'évaluation de $_studentName a été sauvegardée.',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.nunito(fontSize: 14, color: AppColors.textGrey),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                context.go('/home');
              },
              child: Text('Retour à l\'accueil',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final levelName = _levelNames[_level] ?? _level;
    final isPassage = _level == 'Passage';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : Column(
              children: [
                _buildHeader(levelName),
                Expanded(
                  child: _items.isEmpty
                      ? _buildEmpty()
                      : isPassage
                          ? _buildPassageView()
                          : _buildFlashcard(),
                ),
                if (!isPassage && _items.isNotEmpty) _buildNavBar(),
                _buildBottomBar(),
              ],
            ),
    );
  }

  Widget _buildHeader(String levelName) {
    final progress = _items.isEmpty ? 0.0 : (_currentIndex + 1) / _items.length;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Barre d'outils
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => _confirmExit(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          levelName,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          _studentName,
                          style: GoogleFonts.nunito(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Compteur : item actuel / total
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_items.isEmpty ? 0 : _currentIndex + 1} / ${_items.length}',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Barre de progression
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Vue flashcard : un item à la fois
  Widget _buildFlashcard() {
    if (_currentIndex >= _items.length) return const SizedBox();
    final item = _items[_currentIndex];
    final grade = _grades[item.id] ?? -1;
    final isRecording = _recordingItemId == item.id;
    final hasRecording = _recordingPaths.containsKey(item.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Instruction pour le CRL
          Text(
            'Montrez ce mot à l\'enfant et demandez-lui de le lire',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: AppColors.textGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Gap(20),

          // La carte principale avec le texte à lire
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: isRecording
                  ? Border.all(color: AppColors.error, width: 2.5)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Text(
              item.data,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
                height: 1.2,
              ),
            ),
          ),
          const Gap(28),

          // Bouton d'enregistrement (action principale)
          GestureDetector(
            onTap: () => _toggleRecording(item.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: isRecording ? AppColors.error : AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: (isRecording ? AppColors.error : AppColors.primary)
                        .withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  const Gap(10),
                  Text(
                    isRecording ? 'Arrêter l\'enregistrement' : 'Enregistrer la lecture',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Indicateur d'enregistrement existant
          if (hasRecording && !isRecording) ...[
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: AppColors.success, size: 16),
                const Gap(4),
                Text(
                  'Enregistrement sauvegardé',
                  style: GoogleFonts.nunito(
                      fontSize: 12, color: AppColors.success),
                ),
              ],
            ),
          ],
          const Gap(24),

          // Séparateur
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Évaluation',
                  style: GoogleFonts.nunito(
                      fontSize: 12, color: AppColors.textGrey),
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const Gap(16),

          // Boutons de notation
          Row(
            children: [
              Expanded(
                child: _gradeButton(
                  icon: Icons.check_rounded,
                  label: 'Correct',
                  color: AppColors.success,
                  isSelected: grade == 2,
                  onTap: () => _setGrade(item.id, 2),
                ),
              ),
              const Gap(8),
              Expanded(
                child: _gradeButton(
                  icon: Icons.close_rounded,
                  label: 'Faux',
                  color: AppColors.error,
                  isSelected: grade == 1,
                  onTap: () => _setGrade(item.id, 1),
                ),
              ),
              const Gap(8),
              Expanded(
                child: _gradeButton(
                  icon: Icons.remove_rounded,
                  label: 'Skip',
                  color: AppColors.textGrey,
                  isSelected: grade == 9,
                  onTap: () => _setGrade(item.id, 9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Barre de navigation entre les items
  Widget _buildNavBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      color: AppColors.background,
      child: Row(
        children: [
          // Bouton précédent
          IconButton(
            onPressed: _currentIndex > 0
                ? () => setState(() => _currentIndex--)
                : null,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: _currentIndex > 0 ? AppColors.primary : AppColors.border,
          ),
          // Indicateurs de points (un par item)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_items.length, (i) {
                  final itemId = _items[i].id;
                  final grade = _grades[itemId] ?? -1;
                  final isCurrent = i == _currentIndex;
                  Color dotColor;
                  if (grade == 2) dotColor = AppColors.success;
                  else if (grade == 1) dotColor = AppColors.error;
                  else if (grade == 9) dotColor = AppColors.textGrey;
                  else dotColor = AppColors.border;

                  return GestureDetector(
                    onTap: () => setState(() => _currentIndex = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: isCurrent ? 24 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isCurrent ? AppColors.primary : dotColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Bouton suivant
          IconButton(
            onPressed: _currentIndex < _items.length - 1
                ? () => setState(() => _currentIndex++)
                : null,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            color: _currentIndex < _items.length - 1
                ? AppColors.primary
                : AppColors.border,
          ),
        ],
      ),
    );
  }

  Widget _gradeButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : color, size: 16),
            const Gap(4),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPassageView() {
    final item = _items.first;
    final grade = _grades[item.id] ?? -1;
    final isRecording = _recordingItemId == item.id;
    final hasRecording = _recordingPaths.containsKey(item.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Montrez ce texte à l\'enfant et demandez-lui de le lire',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: AppColors.textGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Gap(12),
          // Le texte du passage
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: isRecording
                  ? Border.all(color: AppColors.error, width: 2.5)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              item.data,
              style: GoogleFonts.nunito(
                fontSize: 18,
                height: 1.8,
                color: AppColors.textDark,
              ),
            ),
          ),
          const Gap(20),
          // Bouton d'enregistrement
          GestureDetector(
            onTap: () => _toggleRecording(item.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: isRecording ? AppColors.error : AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: (isRecording ? AppColors.error : AppColors.primary)
                        .withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  const Gap(10),
                  Text(
                    isRecording
                        ? 'Arrêter l\'enregistrement'
                        : 'Enregistrer la lecture',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (hasRecording && !isRecording) ...[
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: AppColors.success, size: 16),
                const Gap(4),
                Text('Enregistrement sauvegardé',
                    style: GoogleFonts.nunito(
                        fontSize: 12, color: AppColors.success)),
              ],
            ),
          ],
          const Gap(24),
          // Boutons de notation en grand
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Évaluation',
                    style: GoogleFonts.nunito(
                        fontSize: 12, color: AppColors.textGrey)),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: _bigGradeButton(
                  label: 'Correct',
                  icon: Icons.check_circle_rounded,
                  color: AppColors.success,
                  isSelected: grade == 2,
                  onTap: () => _setGrade(item.id, 2),
                ),
              ),
              const Gap(12),
              Expanded(
                child: _bigGradeButton(
                  label: 'Faux',
                  icon: Icons.cancel_rounded,
                  color: AppColors.error,
                  isSelected: grade == 1,
                  onTap: () => _setGrade(item.id, 1),
                ),
              ),
            ],
          ),
          const Gap(12),
          SizedBox(
            width: double.infinity,
            child: _bigGradeButton(
              label: 'Sans réponse',
              icon: Icons.remove_circle_rounded,
              color: AppColors.textGrey,
              isSelected: grade == 9,
              onTap: () => _setGrade(item.id, 9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bigGradeButton({
    required String label,
    required IconData icon,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : color, size: 22),
            const Gap(8),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : color,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info_outline, size: 48, color: AppColors.textGrey),
          const Gap(12),
          Text(
            'Aucun item disponible pour ce niveau.',
            style: GoogleFonts.nunito(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: ElevatedButton(
          onPressed: _items.isEmpty ? null : _onNextLevel,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: _isLastLevel ? AppColors.success : AppColors.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isLastLevel ? 'Terminer le test' : 'Niveau suivant',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const Gap(8),
              Icon(_isLastLevel
                  ? Icons.check_circle_outline
                  : Icons.arrow_forward_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmExit() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Quitter le test ?',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
        content: Text(
          'Les réponses du niveau actuel ne seront pas sauvegardées.',
          style: GoogleFonts.nunito(color: AppColors.textGrey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Rester',
                style: GoogleFonts.nunito(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Quitter', style: GoogleFonts.nunito()),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) context.pop();
  }
}
