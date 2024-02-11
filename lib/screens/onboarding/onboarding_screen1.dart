import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(Pixels.screenHeight * (45 / Pixels.figmaScreenHeight)),
          Image.asset("assets/images/ob_screen1.png"),
          Gap(Pixels.screenHeight * (16 / Pixels.figmaScreenHeight)),
          SizedBox(
            width: Pixels.screenWidth * (295 / Pixels.figmaScreenWidth),
            child: PrimaryText(
              child: "Stay organized with your schedules",
              fontSize: Pixels.screenWidth * (27 / Pixels.figmaScreenWidth),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
