import 'package:go_router/go_router.dart';
import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_first.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_second.dart';

final GoRoute onBoardingRoute = GoRoute(
  path: Routes.onBoarding,
  redirect: (context, state) {
    if (state.fullPath == '/onboarding') {
      return Routes.onBoardingFirst;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: 'first',
      builder: (context, state) => const OnboardingFirst(),
    ),
    GoRoute(
      path: 'second',
      builder: (context, state) => const OnboardingSecond(),
    ),
  ],
);
