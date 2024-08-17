import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/screens/add_task_screen/bloc/add_task_bloc.dart';
import 'package:scheduler_pro/presentation/widgets/custom_button/custom_button.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/cubit/date_and_time_cubit.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/custom_textfield.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Create Schedule",
          style: AppTextStyle.title3,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: AppTextStyle.smallBold,
                  ),
                  4.verticalSpace,
                  BlocBuilder<AddTaskBloc, AddTaskState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        validator: ValidationBuilder(requiredMessage: "Title is required").build(),
                        controller: titleController,
                      );
                    },
                  ),
                  16.verticalSpace,
                  Text(
                    "Location / Platform",
                    style: AppTextStyle.smallBold,
                  ),
                  4.verticalSpace,
                  BlocBuilder<AddTaskBloc, AddTaskState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        validator: ValidationBuilder(requiredMessage: "Location is required").build(),
                        controller: locationController,
                      );
                    },
                  ),
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
                        dateController = TextEditingController(text: state.date.toString());
                        return CustomTextfield(
                          showDate: true,
                          hintText: "MMM DD, YYYY",
                          controller: dateController,
                          validator: ValidationBuilder(requiredMessage: "Date is required").build(),
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
                            startTimeController = TextEditingController(text: state.time.toString());
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
                                      width: 140.w,
                                      child: CustomTextfield(
                                        showTime: true,
                                        hintText: "00:00 AM",
                                        controller: startTimeController,
                                        validator: ValidationBuilder(requiredMessage: "Time is required").build(),
                                      ),
                                    ),
                                    16.verticalSpace,
                                  ],
                                ),
                                8.horizontalSpace,
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
                            endTimeController = TextEditingController(text: state.time.toString());
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
                                      width: 140.w,
                                      child: CustomTextfield(
                                        showTime: true,
                                        hintText: "00:00 AM",
                                        controller: endTimeController,
                                        validator: ValidationBuilder(requiredMessage: "Time is required").build(),
                                      ),
                                    ),
                                    16.verticalSpace,
                                  ],
                                ),
                                8.horizontalSpace,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Priority",
                            style: AppTextStyle.smallBold,
                          ),
                          8.verticalSpace,
                          BlocBuilder<AddTaskBloc, AddTaskState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.read<AddTaskBloc>().add(const TaskPriority(priorityIndex: 0));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: state.priorityIndex == 0
                                            ? Border.all(color: AppColors.primaryColor)
                                            : Border.all(),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Low",
                                            style: AppTextStyle.small.copyWith(
                                              color: state.priorityIndex == 0 ? AppColors.primaryColor : null,
                                            ),
                                          ),
                                          4.horizontalSpace,
                                          if (state.priorityIndex == 0)
                                            const Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.primaryColor,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  InkWell(
                                    onTap: () {
                                      context.read<AddTaskBloc>().add(const TaskPriority(priorityIndex: 1));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: state.priorityIndex == 1
                                            ? Border.all(color: AppColors.primaryColor)
                                            : Border.all(),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Medium",
                                            style: AppTextStyle.small.copyWith(
                                              color: state.priorityIndex == 1 ? AppColors.primaryColor : null,
                                            ),
                                          ),
                                          4.horizontalSpace,
                                          if (state.priorityIndex == 1)
                                            const Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.primaryColor,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  InkWell(
                                    onTap: () {
                                      context.read<AddTaskBloc>().add(const TaskPriority(priorityIndex: 2));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: state.priorityIndex == 2
                                            ? Border.all(color: AppColors.primaryColor)
                                            : Border.all(),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "High",
                                            style: AppTextStyle.small.copyWith(
                                              color: state.priorityIndex == 2 ? AppColors.primaryColor : null,
                                            ),
                                          ),
                                          4.horizontalSpace,
                                          if (state.priorityIndex == 2)
                                            const Icon(
                                              Icons.close,
                                              size: 15,
                                              color: AppColors.primaryColor,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      16.horizontalSpace,
                      // Column(
                      //   children: [
                      //     Text(
                      //       "Add Members",
                      //       style: AppTextStyle.smallBold,
                      //     ),
                      //     8.verticalSpace,
                      //     ImageStack(
                      //       imageList: images,
                      //       totalCount: 3,
                      //       extraCountBorderColor: Colors.black,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  15.verticalSpace,
                  Text(
                    "Description",
                    style: AppTextStyle.smallBold,
                  ),
                  6.verticalSpace,
                  BlocBuilder<AddTaskBloc, AddTaskState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        minLines: 3,
                        // validator: ValidationBuilder(requiredMessage: "Description is required").build(),
                        controller: descriptionController,
                      );
                    },
                  ),
                  16.verticalSpace,
                  BlocConsumer<AddTaskBloc, AddTaskState>(
                    listener: (context, state) {
                      if (state.taskAdded) {
                        titleController.clear();
                        locationController.clear();
                        dateController.clear();
                        startTimeController.clear();
                        endTimeController.clear();
                        descriptionController.clear();
                        context.read<AddTaskBloc>().add(TaskAdded());
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Task added successfully"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        onTap: () {
                          print("validated");
                          if (form.currentState!.validate()) {
                            context.read<AddTaskBloc>().add(
                                  TaskData(
                                    title: titleController.text,
                                    location: locationController.text,
                                    date: dateController.text,
                                    startTime: startTimeController.text,
                                    endTime: endTimeController.text,
                                    description: descriptionController.text,
                                  ),
                                );
                            context.read<AddTaskBloc>().add(TaskSubmit());
                          }
                        },
                        isLoading: state.isSubmitting,
                        text: "Add schedule",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
