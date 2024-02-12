import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/components/custom_button.dart';
import 'package:scheduler_pro/components/custom_textfield.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Pixels.screenWidth,
          padding: EdgeInsets.all(
            Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(Pixels.screenHeight * (63 / Pixels.figmaScreenHeight)),
              PrimaryText(
                child: "Sign up",
                fontSize: Pixels.screenWidth * (27 / Pixels.figmaScreenWidth),
                fontWeight: FontWeight.w600,
              ),
              PrimaryText(
                child: "Create a new account.",
                fontSize: Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
                fontWeight: FontWeight.w400,
              ),
              Gap(Pixels.screenHeight * (64 / Pixels.figmaScreenHeight)),
              CustomTextfield(
                hintText: "Name",
                keyboardType: TextInputType.name,
              ),
              Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
              CustomTextfield(
                hintText: "Email ID",
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
              CustomTextfield(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: !passwordVisible!,
              ),
              Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
              CustomTextfield(
                hintText: "Confirm Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: !passwordVisible!,
              ),
              Gap(Pixels.screenHeight * (8 / Pixels.figmaScreenHeight)),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFF3392FF),
                    value: passwordVisible,
                    onChanged: (value) {
                      setState(() {
                        passwordVisible = value;
                      });
                    },
                  ),
                  PrimaryText(
                    child: "Show password",
                    fontWeight: FontWeight.w400,
                    fontSize:
                        Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
                  )
                ],
              ),
              Gap(Pixels.screenHeight * (32 / Pixels.figmaScreenHeight)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryText(
                    child: "Already have an account? ",
                    fontSize:
                        Pixels.screenWidth * (13 / Pixels.figmaScreenWidth),
                  ),
                  GestureDetector(
                    onTap: () => context.push("/signIn"),
                    child: PrimaryText(
                      child: "Login ",
                      color: const Color(0xFF3392FF),
                      fontSize:
                          Pixels.screenWidth * (13 / Pixels.figmaScreenWidth),
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
                text: "Login",
                buttonColor: const Color(0xFF3392FF),
                fontSize: Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
