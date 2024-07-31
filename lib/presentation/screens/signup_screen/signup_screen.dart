import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _form,
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
                CustomTextfield(
                  hintText: "Name",
                  keyboardType: TextInputType.name,
                ),
                16.verticalSpace,
                CustomTextfield(
                  hintText: "Email ID",
                  keyboardType: TextInputType.emailAddress,
                ),
                16.verticalSpace,
                // BlocBuilder<AuthBloc, AuthState>(
                //   builder: (context, state) {
                //     return CustomTextfield(
                //       hintText: "Password",
                //       keyboardType: TextInputType.visiblePassword,
                //       obscureText: state is ShowPasswordState && !state.showPassword,
                //     );
                //   },
                // ),
                16.verticalSpace,
                // BlocBuilder<AuthBloc, AuthState>(
                //   builder: (context, state) {
                //     return CustomTextfield(
                //       hintText: "Confirm Password",
                //       keyboardType: TextInputType.visiblePassword,
                //       obscureText: state is ShowPasswordState && !state.showPassword,
                //     );
                //   },
                // ),
                8.verticalSpace,
                Row(
                  children: [
                    // BlocBuilder<AuthBloc, AuthState>(
                    //   builder: (context, state) {
                    //     return Checkbox(
                    //       activeColor: const Color(0xFF3392FF),
                    //       value: state is ShowPasswordState && state.showPassword,
                    //       onChanged: (value) {
                    //         context.read<AuthBloc>().add(ShowPasswordEvent(showPassword: value!));
                    //       },
                    //     );
                    //   },
                    // ),
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
                // Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(child: Divider()),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 8.0),
                //       child: PrimaryText(child: "Or"),
                //     ),
                //     Expanded(child: Divider()),
                //   ],
                // ),
                // Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
                // Container(
                //   width: Pixels.screenWidth,
                //   height: Pixels.screenHeight * (48 / Pixels.figmaScreenHeight),
                //   padding: EdgeInsets.symmetric(
                //     horizontal:
                //         Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
                //     vertical:
                //         Pixels.screenHeight * (11 / Pixels.figmaScreenHeight),
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(width: 0.8, color: Colors.grey),
                //   ),
                //   child: Stack(
                //     children: [
                //       Image.asset(
                //         "assets/images/google.png",
                //         width:
                //             Pixels.screenWidth * (26 / Pixels.figmaScreenWidth),
                //       ),
                //       Align(
                //         alignment: Alignment.center,
                //         child: PrimaryText(
                //           child: "Continue with Google",
                //           fontSize:
                //               Pixels.screenWidth * (13 / Pixels.figmaScreenWidth),
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Spacer(),
                CustomButton(
                  onTap: () {},
                  isLoading: false,
                  text: "Sign up",
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
