import 'package:go_router/go_router.dart';
import 'package:pratham_clone/features/assessment/screens/select_institution_screen.dart';
import 'package:pratham_clone/features/assessment/screens/select_school_screen.dart';
import 'package:pratham_clone/features/assessment/screens/select_municipality_screen.dart';
import 'package:pratham_clone/features/auth/screens/login_screen.dart';
import 'package:pratham_clone/features/home/screens/home_screen.dart';
import 'package:pratham_clone/features/pull_crl/screens/pull_crl_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/pull-crl',
      builder: (context, state) => const PullCrlScreen(),
    ),
    GoRoute(
      path: '/assessment/municipality',
      builder: (context, state) => const SelectMunicipalityScreen(),
    ),
    GoRoute(
      path: '/assessment/institution',
      builder: (context, state) => SelectInstitutionScreen(
        municipalityId: state.extra as String,
      ),
    ),
      GoRoute(
      path: '/assessment/school',
      builder: (context, state) => SelectSchoolScreen(
        instituteId: state.extra as String,
      ),
    ),
  ],
);
