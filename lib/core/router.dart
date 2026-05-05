import 'package:go_router/go_router.dart';
import 'package:pratham_clone/features/auth/screens/login_screen.dart';
import 'package:pratham_clone/features/home/screens/home_screen.dart';

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
  ],
);
