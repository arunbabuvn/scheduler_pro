import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduler_pro/screens/auth_screen/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoadingState && state.isLoading) {
                  const CircularProgressIndicator();
                } else if (state is AuthErrorState) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(state.errorMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  child: const Text("Sign Out"),
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutEvent());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
