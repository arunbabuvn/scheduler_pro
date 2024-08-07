import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<String> signIn(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "singedIn";
    } catch (e) {
      String errorMessage = "";
      if (e is FirebaseAuthException) {
        errorMessage = "Firebase Authentication error";
        if (e.code == "user-not-found") {
          errorMessage = "User not found";
        } else if (e.code == "wrong-password") {
          errorMessage = "wrong password";
        }
      } else {
        print('An unexpected error occurred: $e');
      }
      return errorMessage;
    }
  }

  Future<String> signUp(
    String email,
    String password,
    String confirmPassword,
    String name,
  ) async {
    if (password == confirmPassword) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _firebaseAuth.currentUser?.updateDisplayName(name);
        return "signedUp";
      } catch (e) {
        String errorMessage = "";
        if (e is FirebaseAuthException) {
          errorMessage = "Firebase Authentication error";
          if (e.code == "weak-password") {
            errorMessage = "The password provided is too weak.";
          } else if (e.code == "email-already-in-use") {
            errorMessage = "The account already exists for that email.";
          }
        } else {
          print('An unexpected error occurred: $e');
        }
        return errorMessage;
      }
    } else {
      return "Passwords don't match";
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return "singedIn";
    } catch (e) {
      String errorMessage = "";
      if (e is FirebaseAuthException) {
        errorMessage = "Firebase Authentication error";
        if (e.code == "user-not-found") {
          errorMessage = "User not found";
        } else if (e.code == "wrong-password") {
          errorMessage = "wrong password";
        }
      } else {
        print('An unexpected error occurred: $e');
      }
      return errorMessage;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}
