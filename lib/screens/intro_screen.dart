import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/components/custom_button.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/intro_bg.png"),
          Column(
            children: [
              const Spacer(),
              Container(
                padding: EdgeInsets.all(
                  Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
                ),
                width: Pixels.screenWidth,
                height: Pixels.screenHeight / 1.9,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(Pixels.screenHeight * (80 / Pixels.figmaScreenHeight)),
                    PrimaryText(
                      child: "Welcome to Scheduler Pro",
                      fontSize:
                          Pixels.screenWidth * (48 / Pixels.figmaScreenWidth),
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      height: 1,
                    ),
                    Gap(Pixels.screenHeight * (8 / Pixels.figmaScreenHeight)),
                    PrimaryText(
                      child: "Manage your time better",
                      fontSize:
                          Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "GetStarted",
                      fontSize:
                          Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                      fontWeight: FontWeight.w700,
                      buttonColor: const Color(0xFF3392FF),
                      textColor: Colors.white,
                      onTap: () {
                        context.push("/onboarding");
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
