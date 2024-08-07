import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/presentation/screens/accounts_screen/accounts_screen.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/signin_screen/signin_screen.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/signup_screen/signup_screen.dart';
import 'package:scheduler_pro/presentation/screens/intro_screen/intro_screen.dart';
import 'package:scheduler_pro/presentation/screens/main_screen/main_screen.dart';
import 'package:scheduler_pro/presentation/screens/onboarding/onboarding_screen.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return "/main";
        } else {
          return "/intro";
        }
      },
    ),
    GoRoute(
      path: "/intro",
      name: "intro",
      builder: (context, state) => const IntroScreen(),
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
