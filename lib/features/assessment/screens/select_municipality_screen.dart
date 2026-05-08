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
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.primary))
            : Column(
                children: [
                  ScreenHeader(
                    title: 'Zones / Communes',
                    subtitle: 'Sélectionnez votre zone d\'intervention',
                    icon: Icons.map_outlined,
                    itemCount: _municipalities.length,
                    itemLabel: 'zones',
                  ),
                  Expanded(
                    child: _municipalities.isEmpty
                        ? _buildEmpty()
                        : _buildList(),
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
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.location_off_outlined,
                size: 48, color: AppColors.primary.withOpacity(0.4)),
          ),
          const Gap(20),
          Text(
            'Aucune zone disponible',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const Gap(8),
          Text(
            'Faites une synchronisation initiale\ndepuis l\'écran d\'enregistrement',
            textAlign: TextAlign.center,
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
      padding: const EdgeInsets.all(20),
      itemCount: _municipalities.length,
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (context, index) {
        final municipality = _municipalities[index];
        return AssessmentCard(
          title: municipality.municipalityName,
          subtitle: 'Appuyez pour voir les inspections',
          icon: Icons.location_city_rounded,
          iconColor: AppColors.primary,
          iconBackground: const Color(0xFFE8F4FD),
          onTap: () => context.push(
            '/assessment/institution',
            extra: municipality.municipalityId,
          ),
        );
      },
    );
  }
}
