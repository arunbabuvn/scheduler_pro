import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/components/custom_button.dart';
import 'package:scheduler_pro/components/custom_textfield.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';
import 'package:scheduler_pro/screens/auth_screen/bloc/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: Pixels.screenHeight,
          width: Pixels.screenWidth,
          padding: const EdgeInsets.all(16).r,
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                63.verticalSpace,
                PrimaryText(
                  child: "Login",
                  fontSize: 27.r,
                  fontWeight: FontWeight.w600,
                ),
                PrimaryText(
                  child: "Enter your username and password.",
                  fontSize: 16.r,
                  fontWeight: FontWeight.w400,
                ),
                64.verticalSpace,
                CustomTextfield(
                  controller: emailController,
                  hintText: "Email ID",
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationBuilder(requiredMessage: "Email ID is required").email().build(),
                ),
                16.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomTextfield(
                      validator: ValidationBuilder(requiredMessage: "Password is required").build(),
                      controller: passwordController,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: state is ShowPasswordState && state.showPassword ? false : true,
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
                          value: state is ShowPasswordState && state.showPassword ? true : false,
                          onChanged: (value) {
                            context.read<AuthBloc>().add(ShowPasswordEvent(showPassword: value!));
                          },
                        );
                      },
                    ),
                    PrimaryText(
                      child: "Show password",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.r,
                    )
                  ],
                ),
                32.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryText(
                      child: "Don't have an account? ",
                      fontSize: 13.r,
                    ),
                    GestureDetector(
                      onTap: () => context.push("/signUp"),
                      child: PrimaryText(
                        child: "Signup ",
                        color: const Color(0xFF3392FF),
                        fontSize: 13.r,
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
                      child: const PrimaryText(child: "Or"),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                16.verticalSpace,
                Container(
                  width: Pixels.screenWidth,
                  height: 48.r,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.r,
                    vertical: 11.r,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.8, color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        width: 26.r,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: PrimaryText(
                          child: "Continue with Google",
                          fontSize: 13.r,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthenticatedState) {
                      context.push('/main');
                    } else if (state is AuthErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text("Login Failed"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state is AuthLoadingState && state.isLoading,
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                SigninWithEmailEvent(
                                  emailId: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                          dispose();
                        }
                      },
                      text: "Login",
                      buttonColor: const Color(0xFF3392FF),
                      fontSize: 19.r,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                    );
                  },
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
