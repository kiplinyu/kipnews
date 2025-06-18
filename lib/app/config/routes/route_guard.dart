// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:kipnews/app/config/routes/routes.dart';

// // core/routes/route_guard.dart
// String? _redirectLogic(BuildContext context, GoRouterState state) {
//   final authState = context.read<AuthNotifier>().state;
//   final currentLocation = state.matchedLocation;

//   // Handle splash redirect
//   if (currentLocation == Routes.splash) {
//     return authState.when(
//       initial: () => null, // Tetap di splash
//       unauthenticated: () => Routes.onBoarding,
//       authenticated: () => Routes.home,
//     );
//   }

//   // Handle auth protection
//   final protectedRoutes = [Routes.home];
//   if (protectedRoutes.contains(currentLocation)) {
//     return authState is Authenticated ? null : Routes.login;
//   }

//   // Allow public routes
//   return null;
// }
