import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:pratham_clone/data/models/department_model.dart';
import 'package:pratham_clone/data/models/municipality_model.dart';
import 'package:pratham_clone/data/services/pull_crl_service.dart';

class PullCrlScreen extends ConsumerStatefulWidget {
  const PullCrlScreen({super.key});

  @override
  ConsumerState<PullCrlScreen> createState() => _PullCrlScreenState();
}

class _PullCrlScreenState extends ConsumerState<PullCrlScreen> {
  final _service = PullCrlService();

  List<DepartmentModel> _departments = [];
  List<MunicipalityModel> _municipalities = [];
  Set<String> _selectedMunicipalityIds = {};

  DepartmentModel? _selectedDepartment;
  bool _isLoadingDepartments = true;
  bool _isLoadingMunicipalities = false;
  bool _isPulling = false;
  String _progressMessage = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDepartments();
  }

  Future<void> _loadDepartments() async {
    try {
      final departments = await _service.getDepartments();
      if (!mounted) return;
      setState(() {
        _departments = departments;
        _isLoadingDepartments = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingDepartments = false;
        _errorMessage = 'Impossible de charger les départements';
      });
    }
  }

  Future<void> _onDepartmentSelected(DepartmentModel department) async {
    setState(() {
      _selectedDepartment = department;
      _municipalities = [];
      _selectedMunicipalityIds = {};
      _isLoadingMunicipalities = true;
      _errorMessage = null;
    });

    try {
      final municipalities = await _service.getMunicipalities(department.stateCode);
      if (!mounted) return;
      setState(() {
        _municipalities = municipalities;
        _isLoadingMunicipalities = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingMunicipalities = false;
        _errorMessage = 'Impossible de charger les municipalités';
      });
    }
  }

  Future<void> _onPull() async {
    if (_selectedMunicipalityIds.isEmpty) {
      setState(() => _errorMessage = 'Sélectionnez au moins une municipalité');
      return;
    }

    final selectedMunicipalities = _municipalities
        .where((m) => _selectedMunicipalityIds.contains(m.municipalityId))
        .toList();

    setState(() {
      _isPulling = true;
      _errorMessage = null;
    });

    try {
      final db = ref.read(databaseProvider);

      await _service.pullAllData(
        municipalities: selectedMunicipalities,
        onProgress: (message) {
          if (mounted) setState(() => _progressMessage = message);
        },
        onCrlsReady: (crls) async {
          for (final crl in crls) {
            await db.insertCrl(CrlTableCompanion(
              crlId: Value(crl['CRLId']?.toString() ?? ''),
              userName: Value(crl['UserName']?.toString() ?? ''),
              password: Value(crl['Password']?.toString() ?? ''),
              firstName: Value(crl['Name']?.toString() ?? ''),
              mobile: Value(crl['Mobile']?.toString() ?? ''),
              email: Value(crl['Email']?.toString() ?? ''),
            ));
          }
        },
        onFormsReady: (institutes, schools, children) {
          // TODO: sauvegarder les formulaires en DB
        },
      );

      if (!mounted) return;
      context.go('/login');
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isPulling = false;
        _errorMessage = 'Erreur lors du téléchargement';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Initialisation',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: _isPulling ? _buildProgress() : _buildForm(),
    );
  }

  Widget _buildProgress() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppColors.primary),
            const Gap(24),
            Text(
              _progressMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sélectionnez votre zone',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          const Gap(8),
          Text(
            'Choisissez un département puis les municipalités à télécharger.',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
          const Gap(24),
          _buildDepartmentDropdown(),
          if (_municipalities.isNotEmpty) ...[
            const Gap(24),
            _buildMunicipalityChips(),
          ],
          if (_errorMessage != null) ...[
            const Gap(16),
            _buildErrorMessage(),
          ],
          const Gap(32),
          ElevatedButton(
            onPressed: _selectedMunicipalityIds.isEmpty ? null : _onPull,
            child: const Text('TÉLÉCHARGER LES DONNÉES'),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentDropdown() {
    if (_isLoadingDepartments) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    return DropdownButtonFormField<DepartmentModel>(
      value: _selectedDepartment,
      hint: Text(
        'Sélectionnez un département',
        style: GoogleFonts.nunito(color: AppColors.textGrey),
      ),
      items: _departments.map((dept) {
        return DropdownMenuItem(
          value: dept,
          child: Text(dept.stateName, style: GoogleFonts.nunito()),
        );
      }).toList(),
      onChanged: (dept) {
        if (dept != null) _onDepartmentSelected(dept);
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.location_on_outlined),
      ),
    );
  }

  Widget _buildMunicipalityChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Municipalités',
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const Gap(12),
        if (_isLoadingMunicipalities)
          const Center(child: CircularProgressIndicator(color: AppColors.primary))
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _municipalities.map((municipality) {
              final isSelected = _selectedMunicipalityIds.contains(municipality.municipalityId);
              return FilterChip(
                label: Text(
                  municipality.municipalityName,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textDark,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedMunicipalityIds.add(municipality.municipalityId);
                    } else {
                      _selectedMunicipalityIds.remove(municipality.municipalityId);
                    }
                  });
                },
                selectedColor: AppColors.primary,
                backgroundColor: AppColors.border,
                checkmarkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 20),
          const Gap(10),
          Expanded(
            child: Text(
              _errorMessage!,
              style: GoogleFonts.nunito(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
