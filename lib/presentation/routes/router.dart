import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/auth_flow.dart';
import 'package:scheduler_pro/presentation/screens/accounts_screen/accounts_screen.dart';
import 'package:scheduler_pro/presentation/screens/signin_screen/signin_screen.dart';
import 'package:scheduler_pro/presentation/screens/signup_screen/signup_screen.dart';
import 'package:scheduler_pro/presentation/screens/main_screen/main_screen.dart';
import 'package:scheduler_pro/presentation/screens/onboarding/onboarding_screen.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const AuthFlow(),
    ),
    GoRoute(
      path: "/onboarding",
      name: "onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: "/signIn",
      name: "signIn",
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: "/signUp",
      name: "signUp",
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: "/main",
      name: "main",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/accounts",
      name: "accounts",
      builder: (context, state) => const AccountsScreen(),
    ),
    GoRoute(
      path: "/search",
      name: "search",
      builder: (context, state) => const AccountsScreen(),
    ),
  ],
);
