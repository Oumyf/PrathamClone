import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:pratham_clone/shared/widgets/assessment_card.dart';
import 'package:pratham_clone/shared/widgets/screen_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectChildScreen extends ConsumerStatefulWidget {
  final String schoolId;

  const SelectChildScreen({super.key, required this.schoolId});

  @override
  ConsumerState<SelectChildScreen> createState() => _SelectChildScreenState();
}

class _SelectChildScreenState extends ConsumerState<SelectChildScreen> {
  List<ChildSurveyTableData> _children = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChildren();
  }

  Future<void> _loadChildren() async {
    try {
      final db = ref.read(databaseProvider);
      final children = await db.getStudentsBySchool(widget.schoolId);
      if (!mounted) return;
      setState(() {
        _children = children;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement enfants: $e');
    }
  }

  Future<void> _addChild(String name) async {
    final db = ref.read(databaseProvider);
    await db.insertStudent(ChildSurveyTableCompanion(
      studentId: Value(DateTime.now().millisecondsSinceEpoch.toString()),
      studentName: Value(name),
      schoolId: Value(widget.schoolId),
    ));
    _loadChildren();
  }

  void _showAddDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Ajouter un enfant',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Nom de l\'enfant',
            prefixIcon: Icon(Icons.child_care_rounded),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Annuler',
                style: GoogleFonts.nunito(color: AppColors.textGrey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _addChild(controller.text.trim());
                Navigator.pop(ctx);
              }
            },
            child: Text('Ajouter', style: GoogleFonts.nunito()),
          ),
        ],
      ),
    );
  }

  // Appelé quand le CRL tape sur un enfant
  void _onChildTap(ChildSurveyTableData child) async {
    final db = ref.read(databaseProvider);
    final languages = await db.getDistinctLanguages();

    if (!mounted) return;

    // Si pas de données ASER, on prévient l'utilisateur
    if (languages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Aucun outil ASER disponible. Faites une synchronisation d\'abord.',
            style: GoogleFonts.nunito(),
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    _showStartTestSheet(child, languages);
  }

  void _showStartTestSheet(ChildSurveyTableData child, List<String> languages) {
    String selectedLanguage = languages.first;
    int selectedSample = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Barre de drag
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Gap(20),
              // Icône + titre
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_circle_rounded,
                    color: AppColors.primary, size: 36),
              ),
              const Gap(12),
              Text(
                'Démarrer l\'évaluation',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                child.studentName,
                style: GoogleFonts.nunito(
                    fontSize: 14, color: AppColors.textGrey),
              ),
              const Gap(24),

              // Sélection de la langue
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Langue du test',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
              ),
              const Gap(10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: languages.map((lang) {
                  final isSelected = lang == selectedLanguage;
                  return GestureDetector(
                    onTap: () =>
                        setSheetState(() => selectedLanguage = lang),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.border,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                )
                              ]
                            : [],
                      ),
                      child: Text(
                        lang,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.white
                              : AppColors.textGrey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Gap(24),

              // Sélection du numéro d'échantillon
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Numéro d\'échantillon',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
              ),
              const Gap(10),
              Row(
                children: List.generate(4, (i) {
                  final n = i + 1;
                  final isSelected = n == selectedSample;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          setSheetState(() => selectedSample = n),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.accent
                              : AppColors.border,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.accent.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  )
                                ]
                              : [],
                        ),
                        child: Text(
                          '$n',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Gap(32),

              // Bouton démarrer
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _startTest(
                    ctx,
                    child: child,
                    language: selectedLanguage,
                    sampleNumber: selectedSample,
                  ),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: Text('Commencer',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startTest(
    BuildContext sheetContext, {
    required ChildSurveyTableData child,
    required String language,
    required int sampleNumber,
  }) async {
    Navigator.pop(sheetContext);

    final db = ref.read(databaseProvider);
    final prefs = await SharedPreferences.getInstance();
    final crlId = prefs.getString('crlId') ?? 'unknown';

    // Identifiant unique de la session
    final examId =
        '${child.studentId}_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now().toIso8601String();

    // On crée la session dans la DB
    await db.insertSession(StudentSessionTableCompanion(
      examId: Value(examId),
      studId: Value(child.studentId),
      crlId: Value(crlId),
      sampleNumber: Value(sampleNumber),
      startTime: Value(now),
      childFullName: Value(child.studentName),
      language: Value(language),
    ));

    // On sauvegarde l'état courant pour que l'écran de test puisse le lire
    await prefs.setString('currentExamId', examId);
    await prefs.setString('currentLevel', 'Letter'); // type exact de l'API
    await prefs.setString('currentLanguage', language);
    await prefs.setInt('currentSampleNumber', sampleNumber);

    if (!mounted) return;
    context.push('/assessment/test', extra: examId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.primary))
            : Column(
                children: [
                  ScreenHeader(
                    title: 'Enfants',
                    subtitle: 'Sélectionnez l\'enfant à évaluer',
                    icon: Icons.child_care,
                    itemCount: _children.length,
                    itemLabel: 'enfants',
                  ),
                  Expanded(
                    child: _children.isEmpty ? _buildEmpty() : _buildList(),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDialog,
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text('Ajouter enfant',
            style: GoogleFonts.nunito(
                color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.child_care_rounded,
                size: 48, color: AppColors.success.withOpacity(0.6)),
          ),
          const Gap(20),
          Text('Aucun enfant disponible',
              style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark)),
          const Gap(8),
          Text('Appuyez sur + pour en ajouter un',
              style:
                  GoogleFonts.nunito(fontSize: 14, color: AppColors.textGrey)),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _children.length,
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (context, index) {
        final child = _children[index];
        return AssessmentCard(
          title: child.studentName,
          subtitle: 'Appuyez pour commencer l\'évaluation',
          icon: Icons.child_care,
          iconColor: AppColors.success,
          iconBackground: const Color(0xFFE8F5E9),
          onTap: () => _onChildTap(child),
        );
      },
    );
  }
}
