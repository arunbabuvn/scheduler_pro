import 'package:flutter/foundation.dart';
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
import 'package:scheduler_pro/presentation/screens/task_screen/bloc/task_update_bloc.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';

class TaskScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const TaskScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0.w,
            right: 16.w,
            top: 16.w,
          ),
          child: BlocProvider(
            create: (context) => TaskUpdateBloc(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                image: Image.network(state.firebaseAuth.currentUser?.photoURL ??
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
                32.verticalSpace,
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: data["priority"] == "High" ? AppColors.primaryColor : AppColors.secondartyColor,
                  ),
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 38,
                              color:
                                  data["priority"] == "High" ? AppColors.lightBackgroundColor : AppColors.darkTextColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: data["priority"] == "High"
                                      ? AppColors.lightBackgroundColor
                                      : AppColors.darkTextColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              data["priority"],
                              style: AppTextStyle.small.copyWith(
                                  color: data["priority"] == "High"
                                      ? AppColors.lightBackgroundColor
                                      : AppColors.darkTextColor),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Text(
                        data["title"],
                        style: AppTextStyle.title3.copyWith(
                          color: data["priority"] == "High" ? AppColors.lightBackgroundColor : AppColors.darkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Date:",
                      style: AppTextStyle.largeBold,
                    ),
                    8.horizontalSpace,
                    Text(
                      data["date"].toString(),
                      style: AppTextStyle.regular,
                    ),
                  ],
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Location:",
                      style: AppTextStyle.regularBold,
                    ),
                    8.horizontalSpace,
                    Text(
                      data["location"].toString(),
                      style: AppTextStyle.regular,
                    ),
                  ],
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Text(
                      "From:",
                      style: AppTextStyle.largeBold,
                    ),
                    8.horizontalSpace,
                    Text(
                      data["startTime"].toString(),
                      style: AppTextStyle.regular,
                    ),
                    16.horizontalSpace,
                    Text(
                      "To:",
                      style: AppTextStyle.largeBold,
                    ),
                    8.horizontalSpace,
                    Text(
                      data["startTime"].toString(),
                      style: AppTextStyle.regular,
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  "Description",
                  style: AppTextStyle.regularBold,
                ),
                8.verticalSpace,
                Text(
                  data["description"].toString(),
                  style: AppTextStyle.regular,
                ),
                const Spacer(),
                BlocConsumer<TaskUpdateBloc, TaskUpdateState>(
                  listener: (context, state) {
                    if (state.isTaskDeleted) {
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      text: "Mark as done",
                      onTap: () {
                        context.read<TaskUpdateBloc>().add(
                              TaskDeleteEvent(
                                docId: data["docId"],
                              ),
                            );
                      },
                    );
                  },
                ),
                16.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
