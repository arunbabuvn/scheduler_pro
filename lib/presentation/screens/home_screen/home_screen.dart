import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_bloc.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_state.dart';
import 'package:scheduler_pro/presentation/screens/home_screen/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void initstate() {
    var homeBloc = HomeBloc();
    homeBloc.add(LoadTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => HomeBloc()..add(LoadTasksEvent()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
              right: 16.w,
              top: 16.w,
            ),
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
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.network(firebaseAuth.currentUser?.photoURL ??
                                        "https://s3-alpha-sig.figma.com/img/c007/b96d/10c6847941b93f45858be7d3ce3ff3ec?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SxjRywecKMyVDVLFAT6DRDa1BM~63bl4DvNTD7zbsG2ihcYR14C5W-bOtJTjp4PSmA2gEwocBcnqp2t0k1EPcTSFzCNkSoXlgSYu0QDVPgHoiI8z13NBLdEo7HD0ATlfcaoHY6AupjYn9j0-~0lJZN4ydgE2UQCYD~U15A-LM1sYi~dxxF0Hnk1ww7Q8m6c1WQ9bYdl~IbcPcu1AhfcSh8xJsffZ3R0RdOLNaH9itruIJe4yi~AnokhwBggvOOWh7XVX6rYpAkb-VUSFh4n5CA8hEa70irdK8Pm~~cpmvOGjEJyEuyUHeWEKMCHOV14DoAgt47Xx8DkBkJGHOc3d-Q__")
                                    .image,
                              ),
                            ),
                            width: 40.w,
                            height: 40.w,
                          );
                        },
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
                BlocBuilder<HomeBloc, HomeState>(
                  // listener: (context, state) => context.read<HomeBloc>().add(LoadTasksEvent()),
                  builder: (context, state) {
                    if (state.taskLoading) {
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    } else if (state.taskEmpty) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No tasks found",
                              style: AppTextStyle.largeBold,
                            ),
                          ],
                        ),
                      );
                    } else if (state.taskLoadingFailed) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.errorMessage.toString(),
                              style: AppTextStyle.largeBold,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                                decoration: BoxDecoration(
                                  color: state.tasks[index].priority == "High"
                                      ? AppColors.primaryColor
                                      : AppColors.secondartyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: state.tasks[index].priority == "High"
                                              ? AppColors.lightBackgroundColor
                                              : AppColors.darkTextColor,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        state.tasks[index].priority.toString(),
                                        style: AppTextStyle.small.copyWith(
                                          color: state.tasks[index].priority == "High"
                                              ? AppColors.lightBackgroundColor
                                              : AppColors.darkTextColor,
                                        ),
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      state.tasks[index].title.toString(),
                                      style: AppTextStyle.title3.copyWith(
                                        color: state.tasks[index].priority == "High"
                                            ? AppColors.lightBackgroundColor
                                            : AppColors.darkTextColor,
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "From ${state.tasks[index].startTime.toString()}",
                                              style: AppTextStyle.smallBold.copyWith(
                                                color: state.tasks[index].priority == "High"
                                                    ? AppColors.lightBackgroundColor
                                                    : AppColors.darkTextColor,
                                              ),
                                            ),
                                            Text(
                                              "To ${state.tasks[index].endTime.toString()}",
                                              style: AppTextStyle.smallBold.copyWith(
                                                color: state.tasks[index].priority == "High"
                                                    ? AppColors.lightBackgroundColor
                                                    : AppColors.darkTextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Date: ${state.tasks[index].date.toString()}",
                                          style: AppTextStyle.smallBold.copyWith(
                                            color: state.tasks[index].priority == "High"
                                                ? AppColors.lightBackgroundColor
                                                : AppColors.darkTextColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              16.verticalSpace,
                            ],
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
