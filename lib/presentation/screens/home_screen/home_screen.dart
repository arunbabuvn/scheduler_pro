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

  @override
  Widget build(BuildContext context) {
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
                          final photoURL =
                              state.firebaseAuth.currentUser?.photoURL;
                          return CircleAvatar(
                            radius: 20.w,
                            backgroundColor: AppColors.secondartyColor,
                            backgroundImage: photoURL != null
                                ? NetworkImage(photoURL)
                                : null,
                            child: photoURL == null
                                ? const Icon(Icons.person,
                                    color: AppColors.darkTextColor)
                                : null,
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
                          color: state.taskIndex == 0
                              ? AppColors.accentColor
                              : AppColors.secondartyColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(const HomeTaskChangeEvent(taskIndex: 0));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                "All (9)",
                                style: state.taskIndex == 0
                                    ? AppTextStyle.smallBold
                                    : AppTextStyle.small,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          color: state.taskIndex == 1
                              ? AppColors.accentColor
                              : AppColors.secondartyColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(const HomeTaskChangeEvent(taskIndex: 1));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                "Todays tasks (4)",
                                style: state.taskIndex == 1
                                    ? AppTextStyle.smallBold
                                    : AppTextStyle.small,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          color: state.taskIndex == 2
                              ? AppColors.accentColor
                              : AppColors.secondartyColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(const HomeTaskChangeEvent(taskIndex: 2));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                "Weekly tasks (5)",
                                style: state.taskIndex == 2
                                    ? AppTextStyle.smallBold
                                    : AppTextStyle.small,
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
                            itemBuilder: (context, index) {
                              print(state.tasks[index].docId);
                              return Column(
                                children: [
                                  Material(
                                    color: state.tasks[index].priority == "High"
                                        ? AppColors.primaryColor
                                        : AppColors.secondartyColor,
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      onTap: () {
                                        context.pushNamed(
                                          "task",
                                          extra: {
                                            "docId": state.tasks[index].docId,
                                            "title": state.tasks[index].title,
                                            "description":
                                                state.tasks[index].description,
                                            "location":
                                                state.tasks[index].location,
                                            "date": state.tasks[index].date,
                                            "startTime":
                                                state.tasks[index].startTime,
                                            "endTime":
                                                state.tasks[index].endTime,
                                            "priority":
                                                state.tasks[index].priority,
                                          },
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(20),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.h, horizontal: 24.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state.tasks[index].title
                                                      .toString(),
                                                  style: AppTextStyle.title3
                                                      .copyWith(
                                                    color: state.tasks[index]
                                                                .priority ==
                                                            "High"
                                                        ? AppColors
                                                            .lightBackgroundColor
                                                        : AppColors
                                                            .darkTextColor,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w,
                                                      vertical: 4.h),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: state.tasks[index]
                                                                  .priority ==
                                                              "High"
                                                          ? AppColors
                                                              .lightBackgroundColor
                                                          : AppColors
                                                              .darkTextColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Text(
                                                    state.tasks[index].priority
                                                        .toString(),
                                                    style: AppTextStyle.small
                                                        .copyWith(
                                                      color: state.tasks[index]
                                                                  .priority ==
                                                              "High"
                                                          ? AppColors
                                                              .lightBackgroundColor
                                                          : AppColors
                                                              .darkTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            8.verticalSpace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "From ${state.tasks[index].startTime.toString()}",
                                                      style: AppTextStyle
                                                          .smallBold
                                                          .copyWith(
                                                        color: state
                                                                    .tasks[
                                                                        index]
                                                                    .priority ==
                                                                "High"
                                                            ? AppColors
                                                                .lightBackgroundColor
                                                            : AppColors
                                                                .darkTextColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      "To ${state.tasks[index].endTime.toString()}",
                                                      style: AppTextStyle
                                                          .smallBold
                                                          .copyWith(
                                                        color: state
                                                                    .tasks[
                                                                        index]
                                                                    .priority ==
                                                                "High"
                                                            ? AppColors
                                                                .lightBackgroundColor
                                                            : AppColors
                                                                .darkTextColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "Date: ${state.tasks[index].date.toString()}",
                                                  style: AppTextStyle.smallBold
                                                      .copyWith(
                                                    color: state.tasks[index]
                                                                .priority ==
                                                            "High"
                                                        ? AppColors
                                                            .lightBackgroundColor
                                                        : AppColors
                                                            .darkTextColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  16.verticalSpace,
                                ],
                              );
                            }),
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
