import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
          SizedBox(
            width: Pixels.screenWidth * (295 / Pixels.figmaScreenWidth),
            child: PrimaryText(
              child: "Enhance your productivity",
              fontSize: Pixels.screenWidth * (27 / Pixels.figmaScreenWidth),
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(Pixels.screenHeight * (27 / Pixels.figmaScreenHeight)),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Pixels.screenHeight * (19 / Pixels.figmaScreenHeight),
              horizontal: Pixels.screenWidth * (24 / Pixels.figmaScreenWidth),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFDDDDDE), shape: BoxShape.circle),
                      height: 40,
                      width: 40,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF3392FF), shape: BoxShape.circle),
                      height: 20,
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
