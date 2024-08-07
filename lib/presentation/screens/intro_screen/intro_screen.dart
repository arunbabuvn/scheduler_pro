import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';

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
                padding: EdgeInsets.all(16.w),
                height: 460.h,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    80.verticalSpace,
                    Text(
                      "Welcome to Scheduler Pro.",
                      style: AppTextStyle.title1,
                      textAlign: TextAlign.center,
                    ),
                    8.verticalSpace,
                    Text(
                      "Manage your time better",
                      style: AppTextStyle.regular,
                    ),
                    const Spacer(),
                    CustomButton(
                      isLoading: false,
                      text: "Get Started",
                      fontSize: 19.sp,
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
