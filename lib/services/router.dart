import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/auth_flow.dart';
import 'package:scheduler_pro/screens/auth_screen/sign_in_screen.dart';
import 'package:scheduler_pro/screens/auth_screen/sign_up_screen.dart';
import 'package:scheduler_pro/screens/main_screen.dart';
import 'package:scheduler_pro/screens/onboarding/onboarding_screen.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const AuthFlow(),
    ),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => const MainScreen(),
    ),
  ],
);
