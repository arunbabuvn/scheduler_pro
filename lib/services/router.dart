import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/screens/intro_screen.dart';
import 'package:scheduler_pro/screens/onboarding/onboarding_screen.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
