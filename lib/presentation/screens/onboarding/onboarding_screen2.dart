import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        16.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          45.verticalSpace,
          Image.asset("assets/images/ob_screen2.png"),
          16.verticalSpace,
          SizedBox(
            width: 295.w,
            child: 
            Text(
              "Get notified when work happens",
              style: AppTextStyle.title2,
            ),
          ),
        ],
      ),
    );
  }
}
