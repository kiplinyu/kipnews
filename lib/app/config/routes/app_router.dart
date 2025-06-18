import 'package:go_router/go_router.dart';
import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/features/auth/presentation/pages/login_page.dart';
import 'package:kipnews/app/features/auth/presentation/pages/register_page.dart';
import 'package:kipnews/app/features/onboarding/presentation/onboarding_route.dart';
import 'package:kipnews/app/features/splash/presentation/pages/splash_page.dart';

// app_router.dart
final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    ...authRoutes,
    ...onBoardingRoutes,
  ],
  // redirect: (context, state) =>
  //     _redirectLogic(context, state), // Tambahkan redirect
  // errorBuilder: (context, state) => const ErrorScreen(), // Tambahkan error page
);

final List<GoRoute> authRoutes = [
  GoRoute(
    path: Routes.register,
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(path: Routes.login, builder: (context, state) => const LoginPage()),
];

final List<GoRoute> onBoardingRoutes = [onBoardingRoute];
