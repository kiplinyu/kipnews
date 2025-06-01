import 'package:go_router/go_router.dart';
import 'package:kipnews/app/features/onboarding/presentation/onboarding_route.dart';
import 'package:kipnews/app/features/splash/presentation/pages/splash_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    onBoardingRoute,
  ],
);
