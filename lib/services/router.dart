import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/screens/auth_screen/sign_in_screen.dart';
import 'package:scheduler_pro/screens/auth_screen/sign_up_screen.dart';
import 'package:scheduler_pro/screens/intro_screen.dart';
import 'package:scheduler_pro/screens/main_screen.dart';
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
    GoRoute(
      path: "/signIn",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => const MainScreen(),
    ),
  ],
);
