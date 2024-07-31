import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gap(Pixels.screenHeight * (45 / Pixels.figmaScreenHeight)),
          const Spacer(),
          SizedBox(
            width: 295.w,
            child: Text(
              "Enhance your productivity",
              style: AppTextStyle.title2,
            ),
          ),
          27.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: 40.w,
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 224.w,
                  child: Text(
                    "Add new tasks fast and easy",
                    style: AppTextStyle.largeBold,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: 40.w,
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 224.w,
                  child: Text(
                    "Visual timeline of your tasks and schedules",
                    style: AppTextStyle.largeBold,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: 40.w,
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 224.w,
                  child: Text(
                    "AI assistant",
                    style: AppTextStyle.largeBold,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: 40.w,
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 224.w,
                  child: Text(
                    "Task reminders",
                    style: AppTextStyle.largeBold,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/ob_screen3_icon.png",
                  width: 40.w,
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 224.w,
                  child: Text(
                    "Collaboration with teams",
                    style: AppTextStyle.largeBold,
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
