import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/components/custom_button.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/screens/onboarding/onboarding_screen1.dart';
import 'package:scheduler_pro/screens/onboarding/onboarding_screen2.dart';
import 'package:scheduler_pro/screens/onboarding/onboarding_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    OnboardingScreen1(),
                    OnboardingScreen2(),
                    OnboardingScreen3(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const WormEffect(
                  dotColor: Color(0xFFB7B7B7),
                  activeDotColor: Color(0xFFCEB0F9),
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                ),
              ),
              Gap(Pixels.screenHeight * (38 / Pixels.figmaScreenHeight)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  isLoading: false,
                  text: "Next",
                  buttonColor: const Color(0xFF3392FF),
                  fontSize: Pixels.screenWidth * (19 / Pixels.figmaScreenWidth),
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  onTap: () {
                    context.push("/signIn");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
