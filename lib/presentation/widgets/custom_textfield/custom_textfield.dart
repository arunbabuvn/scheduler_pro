import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/cubit/date_and_time_cubit.dart';

class CustomTextfield extends StatelessWidget {
  final onChangedValue = "";
  CustomTextfield({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.errorText,
    this.onChanged,
    this.showDate = false,
    this.showTime = false,
    this.maxLines,
    this.minLines,
    this.onSaved,
  });

  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  final bool showDate;
  final bool showTime;
  bool obscureText;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  int? maxLines;
  int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      minLines: maxLines ?? 1,
      maxLines: minLines ?? 1,
      textAlign: showTime ? TextAlign.center : TextAlign.left,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: showDate
            ? IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    context
                        .read<DateAndTimeCubit>()
                        .setDate(DateFormat.yMMMd().format(date));
                  }
                },
              )
            : (showTime
                ? IconButton(
                    icon: const Icon(Icons.timer),
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        context
                            .read<DateAndTimeCubit>()
                            .setTime(time.format(context));
                      }
                    },
                  )
                : null),
        errorText: errorText,
        filled: true,
        fillColor: AppColors.secondartyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.regular,
      ),
    );
  }
}
