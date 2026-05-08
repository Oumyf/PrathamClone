import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:pratham_clone/data/database/tables/school_table.dart';
import 'package:pratham_clone/shared/widgets/assessment_card.dart';
import 'package:pratham_clone/shared/widgets/screen_header.dart';

class SelectSchoolScreen extends ConsumerStatefulWidget {
  final String instituteId;

  const SelectSchoolScreen({super.key, required this.instituteId});

  @override
  ConsumerState<SelectSchoolScreen> createState() => _SelectSchoolScreenState();
}

class _SelectSchoolScreenState extends ConsumerState<SelectSchoolScreen> {
  List<SchoolTableData> _schools = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchools();
  }

  Future<void> _loadSchools() async {
    try {
      final db = ref.read(databaseProvider);
      final schools = await db.getSchoolsByInstitute(widget.instituteId);
      if (!mounted) return;
      setState(() {
        _schools = schools;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement écoles: $e');
    }
  }

  Future<void> _addSchool(String name) async {
    final db = ref.read(databaseProvider);
    await db.insertSchool(SchoolTableCompanion(
      schoolId: Value(DateTime.now().millisecondsSinceEpoch.toString()),
      schoolName: Value(name),
      instituteId: Value(widget.instituteId),
    ));
    _loadSchools();
  }

  void _showAddDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Ajouter une école',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Nom de l\'école',
            prefixIcon: Icon(Icons.school_outlined),
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
                _addSchool(controller.text.trim());
                Navigator.pop(ctx);
              }
            },
            child: Text('Ajouter', style: GoogleFonts.nunito()),
          ),
        ],
      ),
    );
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
                    title: 'Écoles',
                    subtitle: 'Sélectionnez l\'école à évaluer',
                    icon: Icons.school_outlined,
                    itemCount: _schools.length,
                    itemLabel: 'écoles',
                  ),
                  Expanded(
                    child: _schools.isEmpty ? _buildEmpty() : _buildList(),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDialog,
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text('Ajouter école',
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
            child: Icon(Icons.school_outlined,
                size: 48, color: AppColors.success.withOpacity(0.6)),
          ),
          const Gap(20),
          Text('Aucune école disponible',
              style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark)),
          const Gap(8),
          Text('Appuyez sur + pour en ajouter une',
              style:
                  GoogleFonts.nunito(fontSize: 14, color: AppColors.textGrey)),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _schools.length,
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (context, index) {
        final school = _schools[index];
        return AssessmentCard(
          title: school.schoolName,
          subtitle: 'Appuyez pour sélectionner les élèves',
          icon: Icons.school_rounded,
          iconColor: AppColors.success,
          iconBackground: const Color(0xFFE8F5E9),
          onTap: () => context.push('/assessment/child', extra: school.schoolId),
        );
      },
    );
  }
}
