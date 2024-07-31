import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/screens/home_screen/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    DateFormat.MMMd().format(DateTime.now()),
                    style: AppTextStyle.title3,
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none),
                  16.horizontalSpace,
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => context.pushNamed("accounts"),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: Image.network(firebaseAuth.currentUser!.photoURL!).image),
                      ),
                      width: 40.w,
                      height: 40.w,
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: state.taskIndex == 0 ? AppColors.accentColor : AppColors.secondartyColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            context.read<HomeBloc>().add(const HomeTaskChangeEvent(taskIndex: 0));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            child: Text(
                              "All (9)",
                              style: state.taskIndex == 0 ? AppTextStyle.smallBold : AppTextStyle.small,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: state.taskIndex == 1 ? AppColors.accentColor : AppColors.secondartyColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            context.read<HomeBloc>().add(const HomeTaskChangeEvent(taskIndex: 1));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            child: Text(
                              "Todays tasks (4)",
                              style: state.taskIndex == 1 ? AppTextStyle.smallBold : AppTextStyle.small,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: state.taskIndex == 2 ? AppColors.accentColor : AppColors.secondartyColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            context.read<HomeBloc>().add(const HomeTaskChangeEvent(taskIndex: 2));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            child: Text(
                              "Weekly tasks (5)",
                              style: state.taskIndex == 2 ? AppTextStyle.smallBold : AppTextStyle.small,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              16.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightBackgroundColor),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "High",
                                style: AppTextStyle.small.copyWith(
                                  color: AppColors.lightBackgroundColor,
                                ),
                              ),
                            ),
                            8.verticalSpace,
                            Text(
                              "Meeting with the whole team",
                              style: AppTextStyle.title3.copyWith(
                                color: AppColors.lightBackgroundColor,
                              ),
                            ),
                            8.verticalSpace,
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: Image.network(
                                                "https://s3-alpha-sig.figma.com/img/1f7e/657b/cf518fc67cec98b75252e8b48736e08b?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KEzTW54aR52YWhgVKXOWHkTZ5ydgLYOsitjrw6iTtmkrA8HPBGiatmqzeyw8kRv-RavWDN4tdmI1ntGueWGU7mv~8VP1JNGH60mVrC44C-efGXRhSbyUTDVIuSbfyTJ8ut~tFoC5vf-OF~lSp-4FEPbQ6Iwjylpu7zQSq-sJjlX2GhZXEv0D2vXgZ27rufVXN9LjOSVYp0i5blxJLZ4dvQHNi2i0yc44TSWR2SVJqtQlCrAq0-ec6B8KwurLvrQ4scscHR-CNs2sfNgubKwDY84b3vjdNsVEZEAdE23ygKNc4MVxmbiPJvIceA0MG08UCFVYsxT0iTdkEstiWsTb-Q__")
                                            .image),
                                  ),
                                  width: 40.w,
                                  height: 40.w,
                                ),
                                8.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Created",
                                      style: AppTextStyle.smallBold.copyWith(
                                        color: AppColors.lightBackgroundColor,
                                      ),
                                    ),
                                    Text(
                                      "Cameron Wilkinson",
                                      style: AppTextStyle.small.copyWith(
                                        color: AppColors.lightBackgroundColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
