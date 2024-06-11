import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_pro/screens/auth_screen/sign_in_screen.dart';
import 'package:scheduler_pro/screens/main_screen.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.hasData ? const MainScreen() : SignInScreen();
      },
    );
  }
}
