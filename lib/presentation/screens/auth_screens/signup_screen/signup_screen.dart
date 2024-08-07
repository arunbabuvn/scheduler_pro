import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_bloc.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_event.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_state.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  63.verticalSpace,
                  Text(
                    "Sign up",
                    style: AppTextStyle.title3,
                  ),
                  Text(
                    "Create a new account.",
                    style: AppTextStyle.regular,
                  ),
                  64.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        onChanged: (value) {
                          context.read<AuthBloc>().add(NameChanged(name: value));
                          form.currentState!.validate();
                        },
                        hintText: "Name",
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationBuilder(requiredMessage: "Name is required").build(),
                      );
                    },
                  ),
                  16.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        onChanged: (value) {
                          context.read<AuthBloc>().add(EmailChanged(email: value));
                          form.currentState!.validate();
                        },
                        hintText: "Email ID",
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationBuilder(requiredMessage: "Email ID is required").email().build(),
                      );
                    },
                  ),
                  16.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        onChanged: (value) {
                          context.read<AuthBloc>().add(PasswordChanged(password: value));
                          form.currentState!.validate();
                        },
                        validator: ValidationBuilder(requiredMessage: "Password is required").build(),
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !state.isPasswordVisible,
                      );
                    },
                  ),
                  16.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        onChanged: (value) {
                          context.read<AuthBloc>().add(ConfirmPasswordChanged(confirmPassword: value));
                          form.currentState!.validate();
                        },
                        validator: ValidationBuilder(requiredMessage: "Password is required").build(),
                        hintText: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !state.isPasswordVisible,
                      );
                    },
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Checkbox(
                            activeColor: const Color(0xFF3392FF),
                            value: state.isPasswordVisible,
                            onChanged: (value) {
                              context.read<AuthBloc>().add(TogglePasswordVisibility());
                            },
                          );
                        },
                      ),
                      Text(
                        "Show password",
                        style: AppTextStyle.regular,
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppTextStyle.small,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/signIn"),
                        child: Text(
                          "Login",
                          style: AppTextStyle.small.copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.signedIn) {
                        context.go('/');
                      } else if (state.isFailure) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            icon: const Icon(Icons.error, color: Colors.red),
                            content: Text(
                              state.errorMessage,
                              style: AppTextStyle.regularBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        context.read<AuthBloc>().add(SigninFailureAcknowledged());
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state.isSubmitting,
                        onTap: () {
                          if (form.currentState!.validate()) {
                            print("validated");
                            context.read<AuthBloc>().add(SignUpSubmited());
                          }
                        },
                        text: "Sign up",
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
