import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';

class CalanderScreen extends StatelessWidget {
  const CalanderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chevron_left,
                          ),
                          6.horizontalSpace,
                          Text(
                            "May",
                            style: AppTextStyle.regular,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "June",
                    style: AppTextStyle.title3,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "May",
                            style: AppTextStyle.regular,
                          ),
                          6.horizontalSpace,
                          const Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              SizedBox(
                height: 55.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 31,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    children: [
                      index == 0 ? 12.horizontalSpace : 0.horizontalSpace,
                      Container(
                        height: 55.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.accentColor,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Mon",
                              style: AppTextStyle.tiny,
                            ),
                            4.verticalSpace,
                            Text(
                              "${index + 1}",
                              style: AppTextStyle.regularBold,
                            )
                          ],
                        ),
                      ),
                      33.horizontalSpace,
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
