import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/cubit/date_and_time_cubit.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/custom_textfield.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Create Schedule",
                  style: AppTextStyle.title3,
                ),
              ),
              27.verticalSpace,
              Text(
                "Title",
                style: AppTextStyle.smallBold,
              ),
              4.verticalSpace,
              CustomTextfield(hintText: "", keyboardType: TextInputType.name),
              16.verticalSpace,
              Text(
                "Location / Platform",
                style: AppTextStyle.smallBold,
              ),
              4.verticalSpace,
              CustomTextfield(hintText: "", keyboardType: TextInputType.name),
              16.verticalSpace,
              Text(
                "Date",
                style: AppTextStyle.smallBold,
              ),
              4.verticalSpace,
              BlocProvider(
                create: (context) => DateAndTimeCubit(),
                child: BlocBuilder<DateAndTimeCubit, DateAndTimeState>(
                  builder: (context, state) {
                    return CustomTextfield(
                      hintText: "",
                      keyboardType: TextInputType.name,
                      showDate: true,
                      controller: TextEditingController(text: state.date),
                    );
                  },
                ),
              ),
              16.verticalSpace,
              Row(
                children: [
                  BlocProvider(
                    create: (context) => DateAndTimeCubit(),
                    child: BlocBuilder<DateAndTimeCubit, DateAndTimeState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start time",
                                  style: AppTextStyle.smallBold,
                                ),
                                4.verticalSpace,
                                SizedBox(
                                  width: 100.w,
                                  child: CustomTextfield(
                                    hintText: "",
                                    keyboardType: TextInputType.name,
                                    showTime: true,
                                    controller: TextEditingController(
                                      text: state.time.toString().split(" ")[0],
                                    ),
                                  ),
                                ),
                                16.verticalSpace,
                              ],
                            ),
                            8.horizontalSpace,
                            Text(
                              state.time.toString().split(" ")[1],
                              style: AppTextStyle.regular,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  BlocProvider(
                    create: (context) => DateAndTimeCubit(),
                    child: BlocBuilder<DateAndTimeCubit, DateAndTimeState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "End time",
                                  style: AppTextStyle.smallBold,
                                ),
                                4.verticalSpace,
                                SizedBox(
                                  width: 100.w,
                                  child: CustomTextfield(
                                    hintText: "",
                                    keyboardType: TextInputType.name,
                                    showTime: true,
                                    controller: TextEditingController(
                                      text: state.time.toString().split(" ")[0],
                                    ),
                                  ),
                                ),
                                16.verticalSpace,
                              ],
                            ),
                            8.horizontalSpace,
                            Text(
                              state.time.toString().split(" ")[1],
                              style: AppTextStyle.regular,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Priority",
                        style: AppTextStyle.smallBold,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
