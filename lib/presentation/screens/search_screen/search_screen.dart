import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/custom_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Search",
                style: AppTextStyle.title3,
              ),
              16.verticalSpace,
              CustomTextfield(hintText: "Search", keyboardType: TextInputType.name),
              30.verticalSpace,
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondartyColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 47.w,
                            height: 47.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: Image.network(firebaseAuth.currentUser!.photoURL!).image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          16.horizontalSpace,
                          Text(
                            "Meeting with the whole team",
                            style: AppTextStyle.regularBold,
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
