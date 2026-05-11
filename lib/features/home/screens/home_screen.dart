import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratham_clone/core/theme.dart';
import 'package:pratham_clone/data/database/app_database.dart';
import 'package:pratham_clone/data/database/database_provider.dart';
import 'package:pratham_clone/data/services/sync_service.dart';

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
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
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
            icon: const Icon(Icons.bar_chart_outlined),
            selectedIcon:
                const Icon(Icons.bar_chart, color: AppColors.primary),
            label: 'Résultats',
          ),
        ],
      ),
    );
  }
}

// ─── Onglet Évaluation ───────────────────────────────────────────────────────

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
            Text('Évaluation',
                style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark)),
            const Gap(4),
            Text('Sélectionnez une zone pour commencer',
                style: GoogleFonts.nunito(
                    fontSize: 15, color: AppColors.textGrey)),
            const Gap(32),
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
                child: const Icon(Icons.play_circle_outline_rounded,
                    color: AppColors.primary, size: 32),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Démarrer une évaluation',
                        style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark)),
                    const Gap(4),
                    Text('Municipalité → École → Enfant',
                        style: GoogleFonts.nunito(
                            fontSize: 13, color: AppColors.textGrey)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppColors.textGrey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Onglet Sync ─────────────────────────────────────────────────────────────

class _SyncTab extends ConsumerStatefulWidget {
  const _SyncTab();

  @override
  ConsumerState<_SyncTab> createState() => _SyncTabState();
}

class _SyncTabState extends ConsumerState<_SyncTab> {
  final _syncService = SyncService();
  List<StudentSessionTableData> _pending = [];
  bool _isLoading = true;
  bool _isSyncing = false;
  String _progressMessage = '';
  int _progressDone = 0;
  int _progressTotal = 0;

  @override
  void initState() {
    super.initState();
    _loadPending();
  }

  Future<void> _loadPending() async {
    final db = ref.read(databaseProvider);
    final pending = await db.getNotPushedSessions();
    if (!mounted) return;
    setState(() {
      _pending = pending;
      _isLoading = false;
    });
  }

  Future<void> _startSync() async {
    setState(() {
      _isSyncing = true;
      _progressDone = 0;
      _progressTotal = _pending.length;
      _progressMessage = 'Préparation...';
    });

    final db = ref.read(databaseProvider);
    final result = await _syncService.syncAll(
      db,
      onProgress: (msg, done, total) {
        if (mounted) {
          setState(() {
            _progressMessage = msg;
            _progressDone = done;
            _progressTotal = total;
          });
        }
      },
    );

    if (!mounted) return;
    setState(() => _isSyncing = false);
    await _loadPending();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result.failed == 0
              ? '${result.done} session(s) synchronisée(s) avec succès'
              : '${result.done} réussie(s), ${result.failed} échouée(s)',
          style: GoogleFonts.nunito(),
        ),
        backgroundColor:
            result.failed == 0 ? AppColors.success : AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Synchronisation',
                style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark)),
            const Gap(4),
            Text('Envoyez les évaluations au serveur',
                style: GoogleFonts.nunito(
                    fontSize: 15, color: AppColors.textGrey)),
            const Gap(24),

            if (_isSyncing) ...[
              _buildSyncProgress(),
            ] else if (_isLoading) ...[
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
            ] else ...[
              _buildPendingCard(),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _pending.isEmpty ? null : _startSync,
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: Text(
                    _pending.isEmpty
                        ? 'Tout est synchronisé'
                        : 'Synchroniser ${_pending.length} session(s)',
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: _pending.isEmpty
                        ? AppColors.textGrey
                        : AppColors.primary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPendingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: (_pending.isEmpty ? AppColors.success : AppColors.accent)
                  .withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _pending.isEmpty
                  ? Icons.check_circle_rounded
                  : Icons.pending_actions_rounded,
              color: _pending.isEmpty ? AppColors.success : AppColors.accent,
              size: 28,
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _pending.isEmpty
                      ? 'Tout est à jour'
                      : '${_pending.length} session(s) en attente',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const Gap(2),
                Text(
                  _pending.isEmpty
                      ? 'Toutes les données ont été envoyées'
                      : 'Ces évaluations n\'ont pas encore été envoyées',
                  style: GoogleFonts.nunito(
                      fontSize: 12, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncProgress() {
    final progress =
        _progressTotal > 0 ? _progressDone / _progressTotal : 0.0;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          const Gap(20),
          Text(
            _progressMessage,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark),
          ),
          const Gap(16),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.border,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          const Gap(8),
          Text(
            '$_progressDone / $_progressTotal',
            style: GoogleFonts.nunito(
                fontSize: 13, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}

// ─── Onglet Résultats ─────────────────────────────────────────────────────────

class _ResultsTab extends ConsumerStatefulWidget {
  const _ResultsTab();

  @override
  ConsumerState<_ResultsTab> createState() => _ResultsTabState();
}

class _ResultsTabState extends ConsumerState<_ResultsTab> {
  List<StudentSessionTableData> _sessions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  Future<void> _loadSessions() async {
    final db = ref.read(databaseProvider);
    final sessions = await db.getAllSessions();
    if (!mounted) return;
    setState(() {
      _sessions = sessions;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Résultats',
                          style: GoogleFonts.nunito(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark)),
                      Text('Évaluations complétées',
                          style: GoogleFonts.nunito(
                              fontSize: 15, color: AppColors.textGrey)),
                    ],
                  ),
                ),
                // Badge avec le total
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_sessions.length} test${_sessions.length != 1 ? 's' : ''}',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primary))
                : _sessions.isEmpty
                    ? _buildEmpty()
                    : RefreshIndicator(
                        onRefresh: _loadSessions,
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                          itemCount: _sessions.length,
                          separatorBuilder: (_, __) => const Gap(12),
                          itemBuilder: (context, index) =>
                              _SessionCard(session: _sessions[index]),
                        ),
                      ),
          ),
        ],
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
            child: Icon(Icons.bar_chart_rounded,
                size: 48, color: AppColors.primary.withOpacity(0.4)),
          ),
          const Gap(20),
          Text('Aucun résultat pour l\'instant',
              style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark)),
          const Gap(8),
          Text('Les évaluations complétées\napparaîtront ici',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.nunito(fontSize: 14, color: AppColors.textGrey)),
        ],
      ),
    );
  }
}

// ─── Carte d'une session ──────────────────────────────────────────────────────

class _SessionCard extends ConsumerStatefulWidget {
  final StudentSessionTableData session;

  const _SessionCard({required this.session});

  @override
  ConsumerState<_SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends ConsumerState<_SessionCard> {
  int _correct = 0;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final db = ref.read(databaseProvider);
    final stats = await db.getSessionStats(widget.session.examId);
    if (!mounted) return;
    setState(() {
      _correct = stats['correct'] ?? 0;
      _total = stats['total'] ?? 0;
    });
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate);
      return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}  ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoDate;
    }
  }

  String _formatDuration() {
    if (widget.session.endTime == null) return 'En cours';
    try {
      final start = DateTime.parse(widget.session.startTime);
      final end = DateTime.parse(widget.session.endTime!);
      final diff = end.difference(start);
      if (diff.inMinutes < 1) return '${diff.inSeconds}s';
      return '${diff.inMinutes}m ${diff.inSeconds % 60}s';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final isComplete = session.endTime != null;
    final scorePercent = _total > 0 ? _correct / _total : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Avatar avec initiale
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      session.childFullName.isNotEmpty
                          ? session.childFullName[0].toUpperCase()
                          : '?',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.childFullName,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        _formatDate(session.startTime),
                        style: GoogleFonts.nunito(
                            fontSize: 12, color: AppColors.textGrey),
                      ),
                    ],
                  ),
                ),
                // Badge statut
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isComplete
                        ? AppColors.success.withOpacity(0.12)
                        : AppColors.accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isComplete ? 'Terminé' : 'En cours',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isComplete
                          ? AppColors.success
                          : AppColors.accent,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),

            // Infos langue + durée
            Row(
              children: [
                _infoChip(Icons.language_rounded, session.language),
                const Gap(8),
                _infoChip(Icons.timer_outlined, _formatDuration()),
                if (!session.isPushed) ...[
                  const Gap(8),
                  _infoChip(Icons.cloud_off_rounded, 'Non synchronisé',
                      color: AppColors.error),
                ],
              ],
            ),

            // Score (si des réponses existent)
            if (_total > 0) ...[
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_correct / $_total bonnes réponses',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textGrey,
                              ),
                            ),
                            Text(
                              '${(scorePercent * 100).round()}%',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: _scoreColor(scorePercent),
                              ),
                            ),
                          ],
                        ),
                        const Gap(4),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: scorePercent,
                            minHeight: 6,
                            backgroundColor: AppColors.border,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                _scoreColor(scorePercent)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String label,
      {Color color = AppColors.textGrey}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: color),
        const Gap(4),
        Text(label,
            style: GoogleFonts.nunito(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Color _scoreColor(double percent) {
    if (percent >= 0.7) return AppColors.success;
    if (percent >= 0.4) return AppColors.accent;
    return AppColors.error;
  }
}
