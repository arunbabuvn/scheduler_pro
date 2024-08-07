import 'package:flutter/cupertino.dart';
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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                    "Login",
                    style: AppTextStyle.title3,
                  ),
                  Text(
                    "Enter your username and password.",
                    style: AppTextStyle.regular,
                  ),
                  64.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        onChanged: (value) {
                          context.read<AuthBloc>().add(EmailChanged(email: value));
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
                        validator: ValidationBuilder(requiredMessage: "Password is required").build(),
                        onChanged: (value) {
                          context.read<AuthBloc>().add(PasswordChanged(password: value));
                        },
                        hintText: "Password",
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
                        "Don't have an account? ",
                        style: AppTextStyle.small,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/signUp"),
                        child: Text(
                          "Signup",
                          style: AppTextStyle.small.copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                        child: const Text("Or"),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  16.verticalSpace,
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.8, color: Colors.grey),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state.signedIn) {
                            context.go('/main');
                          } else if (state.isFailure) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
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
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              context.read<AuthBloc>().add(SigninWithGoogle());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 11.h,
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/google.png",
                                    width: 26.w,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: state.isSubmitting
                                        ? const CupertinoActivityIndicator(
                                            color: Colors.black,
                                          )
                                        : Text(
                                            "Continue with Google",
                                            style: AppTextStyle.smallBold,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                            context.read<AuthBloc>().add(SigninSubmitted());
                          }
                        },
                        text: "Login",
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
