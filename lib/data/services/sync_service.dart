import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pratham_clone/core/constants.dart';
import 'package:pratham_clone/data/database/app_database.dart';

class SyncService {
  final _dio = Dio();

  /// Synchronise toutes les sessions non encore envoyées.
  /// [onProgress] est appelé à chaque étape avec un message et un index/total.
  Future<SyncResult> syncAll(
    AppDatabase db, {
    required void Function(String message, int done, int total) onProgress,
  }) async {
    final sessions = await db.getNotPushedSessions();
    if (sessions.isEmpty) return SyncResult(done: 0, failed: 0);

    int done = 0;
    int failed = 0;

    for (int i = 0; i < sessions.length; i++) {
      final session = sessions[i];
      onProgress(
        'Envoi de ${session.childFullName}...',
        i,
        sessions.length,
      );

      try {
        await _syncSession(db, session);
        done++;
      } catch (e) {
        failed++;
      }
    }

    return SyncResult(done: done, failed: failed);
  }

  Future<void> _syncSession(
      AppDatabase db, StudentSessionTableData session) async {
    // 1. Charger les réponses et les infos de l'étudiant
    final answers = await db.getAnswersByExamAll(session.examId);
    final student = await db.getStudentById(session.studId);

    // 2. Construire le JSON de la session
    final sessionJson = _buildSessionJson(session, answers, student);

    // 3. Créer le ZIP en mémoire
    final zipBytes = await _buildZip(session.examId, sessionJson, answers);

    // 4. Sauvegarder le ZIP dans un fichier temporaire
    final dir = await getTemporaryDirectory();
    final zipFile = File('${dir.path}/${session.examId}.zip');
    await zipFile.writeAsBytes(zipBytes);

    // 5. Envoyer au serveur
    final formData = FormData.fromMap({
      'zipfile': await MultipartFile.fromFile(
        zipFile.path,
        filename: '${session.examId}.zip',
      ),
    });

    final response = await _dio.post(
      ApiConstants.pushZipFiles,
      data: formData,
      options: Options(
        headers: {'Content-Type': 'multipart/form-data'},
      ),
    );

    // 6. Nettoyer le fichier temporaire
    if (await zipFile.exists()) await zipFile.delete();

    // 7. Marquer comme envoyé si succès
    final status = response.data['status'];
    if (status == 'success' || response.statusCode == 200) {
      await db.markSessionPushed(session.examId);
    } else {
      throw Exception('Serveur a retourné: ${response.data}');
    }
  }

  Map<String, dynamic> _buildSessionJson(
    StudentSessionTableData session,
    List<AserToolAnswersTableData> answers,
    ChildSurveyTableData? student,
  ) {
    return {
      'id': session.examId,
      'childFullName': session.childFullName,
      'childAge': student?.age ?? '',
      'gender': student?.gender ?? '',
      'registeredStudId': session.studId,
      'startTime': session.startTime,
      'endTime': session.endTime ?? '',
      'crlId': session.crlId,
      'sampleNumber': session.sampleNumber,
      'proficiency': session.proficiency ?? '-',
      'aserToolLang': session.language,
      'aserToolYear': '2024',
      'isTestCompleted': session.endTime != null,
      'sequenceList': answers
          .map((a) => {
                'que_id': a.queId,
                'que_text': a.queText,
                'type': a.type,
                'grade': a.grade,
                'recordingName': a.recordingName ?? '',
                'answer': '',
              })
          .toList(),
    };
  }

  Future<List<int>> _buildZip(
    String examId,
    Map<String, dynamic> sessionJson,
    List<AserToolAnswersTableData> answers,
  ) async {
    final encoder = ZipEncoder();
    final archive = Archive();

    // Ajouter le JSON
    final jsonBytes = utf8.encode(jsonEncode(sessionJson));
    archive.addFile(
      ArchiveFile('$examId/${examId}INFO.json', jsonBytes.length, jsonBytes),
    );

    // Ajouter les fichiers audio existants
    for (final answer in answers) {
      final path = answer.recordingName;
      if (path == null || path.isEmpty) continue;
      final audioFile = File(path);
      if (!await audioFile.exists()) continue;

      final audioBytes = await audioFile.readAsBytes();
      final filename = path.split('/').last;
      archive.addFile(
        ArchiveFile('$examId/$filename', audioBytes.length, audioBytes),
      );
    }

    return encoder.encode(archive)!;
  }
}

class SyncResult {
  final int done;
  final int failed;
  const SyncResult({required this.done, required this.failed});
}
