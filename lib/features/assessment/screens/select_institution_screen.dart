import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:pratham_clone/data/database/tables/institute_table.dart';

class SelectInstitutionScreen extends ConsumerStatefulWidget {
  final String municipalityId;

  const SelectInstitutionScreen({super.key, required this.municipalityId});

  @override
  ConsumerState<SelectInstitutionScreen> createState() =>
      _SelectInstitutionScreenState();
}

class _SelectInstitutionScreenState
    extends ConsumerState<SelectInstitutionScreen> {
  List<InstituteTableData> _institutes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInstitutes();
  }

  Future<void> _loadInstitutes() async {
    try {
      final db = ref.read(databaseProvider);
      final institutes =
          await db.getInstitutesByMunicipality(widget.municipalityId);
      if (!mounted) return;
      setState(() {
        _institutes = institutes;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement instituts: $e');
    }
  }

  Future<void> _addInstitute(String name) async {
    final db = ref.read(databaseProvider);
    await db.insertInstitute(InstituteTableCompanion(
      instituteId: Value(DateTime.now().millisecondsSinceEpoch.toString()),
      instituteName: Value(name),
      municipalityId: Value(widget.municipalityId),
    ));
    _loadInstitutes();
  }

  void _showAddDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Ajouter un institut',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: "Nom de l'institut",
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
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(80, 40),
            ),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _addInstitute(controller.text.trim());
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
      appBar: AppBar(
        title: Text(
          'Instituts',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary))
          : _institutes.isEmpty
              ? _buildEmpty()
              : _buildList(),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school_outlined,
              size: 64, color: AppColors.textGrey.withOpacity(0.5)),
          const Gap(16),
          Text(
            'Aucun institut disponible',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: AppColors.textGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(8),
          Text(
            'Appuyez sur + pour en ajouter un',
            style: GoogleFonts.nunito(fontSize: 14, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _institutes.length,
      separatorBuilder: (_, __) => const Gap(8),
      itemBuilder: (context, index) {
        final institute = _institutes[index];
        return Card(
          child: InkWell(
            onTap: () => context.push(
              '/assessment/school',
              extra: institute.instituteId,
            ),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.school_rounded,
                        color: AppColors.accent),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Text(
                      institute.instituteName,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.textGrey, size: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
