import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = const [
    _AssessmentTab(),
    _SyncTab(),
    _ResultsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primary.withOpacity(0.15),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.assignment_outlined),
            selectedIcon: const Icon(Icons.assignment, color: AppColors.primary),
            label: 'Évaluation',
          ),
          NavigationDestination(
            icon: const Icon(Icons.sync_outlined),
            selectedIcon: const Icon(Icons.sync, color: AppColors.primary),
            label: 'Sync',
          ),
          NavigationDestination(
            icon: const Icon(Icons.check_circle_outline),
            selectedIcon: const Icon(Icons.check_circle, color: AppColors.primary),
            label: 'Résultats',
          ),
        ],
      ),
    );
  }
}

class _AssessmentTab extends StatelessWidget {
  const _AssessmentTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Évaluation',
              style: GoogleFonts.nunito(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sélectionnez une zone pour commencer',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(height: 32),
            _buildStartCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStartCard(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push('/assessment/municipality'),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.play_circle_outline_rounded,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Démarrer une évaluation',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sélectionner municipalité → école → enfant',
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
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
  }
}

class _SyncTab extends StatelessWidget {
  const _SyncTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Synchronisation',
              style: GoogleFonts.nunito(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Envoyez les données collectées au serveur',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: implémenter la sync
              },
              icon: const Icon(Icons.cloud_upload_outlined),
              label: const Text('SYNCHRONISER'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultsTab extends StatelessWidget {
  const _ResultsTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Résultats',
              style: GoogleFonts.nunito(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Évaluations complétées avec succès',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
