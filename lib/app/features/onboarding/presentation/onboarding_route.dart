import 'package:go_router/go_router.dart';
import 'package:kipnews/app/config/routes/routes.dart';
import 'package:kipnews/app/features/onboarding/presentation/pages/onboarding_skeleton.dart';

final GoRoute onBoardingRoute = GoRoute(
  path: Routes.onBoarding,
  builder: (context, state) => const OnboardingSkeleton(),
);
