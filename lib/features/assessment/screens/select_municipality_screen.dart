import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';

class SelectMunicipalityScreen extends ConsumerStatefulWidget {
  const SelectMunicipalityScreen({super.key});

  @override
  ConsumerState<SelectMunicipalityScreen> createState() =>
      _SelectMunicipalityScreenState();
}

class _SelectMunicipalityScreenState
    extends ConsumerState<SelectMunicipalityScreen> {
  List<MunicipalityTableData> _municipalities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMunicipalities();
  }

  Future<void> _loadMunicipalities() async {
    try {
      final db = ref.read(databaseProvider);
      final municipalities = await db.getAllMunicipalities();
      if (!mounted) return;
      setState(() {
        _municipalities = municipalities;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement municipalités: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Municipalités',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary))
          : _municipalities.isEmpty
              ? _buildEmpty()
              : _buildList(),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off_outlined,
              size: 64, color: AppColors.textGrey.withOpacity(0.5)),
          const Gap(16),
          Text(
            'Aucune municipalité disponible',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: AppColors.textGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(8),
          Text(
            'Faites une synchronisation initiale',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _municipalities.length,
      separatorBuilder: (_, __) => const Gap(8),
      itemBuilder: (context, index) {
        final municipality = _municipalities[index];
        return Card(
          child: InkWell(
            onTap: () {
              context.push(
                '/assessment/institution',
                extra: municipality.municipalityId,
              );
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.location_city_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Text(
                      municipality.municipalityName,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.textGrey,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
