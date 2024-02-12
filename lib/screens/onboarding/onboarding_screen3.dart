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
          // Gap(Pixels.screenHeight * (45 / Pixels.figmaScreenHeight)),
          const Spacer(),
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
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: Pixels.screenWidth * (40 / Pixels.figmaScreenWidth),
                ),
                Gap(Pixels.screenWidth * (16 / Pixels.figmaScreenWidth)),
                SizedBox(
                  width: Pixels.screenWidth * (224 / Pixels.figmaScreenWidth),
                  child: PrimaryText(
                    child: "Add new tasks fast and easy",
                    fontSize:
                        Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Gap(Pixels.screenHeight * (24 / Pixels.figmaScreenHeight)),
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
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: Pixels.screenWidth * (40 / Pixels.figmaScreenWidth),
                ),
                Gap(Pixels.screenWidth * (16 / Pixels.figmaScreenWidth)),
                SizedBox(
                  width: Pixels.screenWidth * (224 / Pixels.figmaScreenWidth),
                  child: PrimaryText(
                    child: "Visual timeline of your tasks and schedules",
                    fontSize:
                        Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Gap(Pixels.screenHeight * (24 / Pixels.figmaScreenHeight)),
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
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: Pixels.screenWidth * (40 / Pixels.figmaScreenWidth),
                ),
                Gap(Pixels.screenWidth * (16 / Pixels.figmaScreenWidth)),
                SizedBox(
                  width: Pixels.screenWidth * (224 / Pixels.figmaScreenWidth),
                  child: PrimaryText(
                    child: "AI assistant",
                    fontSize:
                        Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Gap(Pixels.screenHeight * (24 / Pixels.figmaScreenHeight)),
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
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: Pixels.screenWidth * (40 / Pixels.figmaScreenWidth),
                ),
                Gap(Pixels.screenWidth * (16 / Pixels.figmaScreenWidth)),
                SizedBox(
                  width: Pixels.screenWidth * (224 / Pixels.figmaScreenWidth),
                  child: PrimaryText(
                    child: "Task reminders",
                    fontSize:
                        Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Gap(Pixels.screenHeight * (24 / Pixels.figmaScreenHeight)),
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
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: Pixels.screenWidth * (40 / Pixels.figmaScreenWidth),
                ),
                Gap(Pixels.screenWidth * (16 / Pixels.figmaScreenWidth)),
                SizedBox(
                  width: Pixels.screenWidth * (224 / Pixels.figmaScreenWidth),
                  child: PrimaryText(
                    child: "Collaboration with teams",
                    fontSize:
                        Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
