import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/core/theme/app_text_style.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/cubit/date_and_time_cubit.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.errorText,
    this.onChanged,
    this.showDate = false,
    this.showTime = false,
  });

  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;
  final bool showDate;
  final bool showTime;
  bool obscureText;
  final TextEditingController? controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: showTime ? TextAlign.center : TextAlign.left,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      readOnly: showDate || showTime,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
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
      onTap: () async {
        if (showDate) {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            context.read<DateAndTimeCubit>().setDate(DateFormat.yMMMd().format(date));
          }
        }
        if (showTime) {
          TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null) {
            context.read<DateAndTimeCubit>().setTime(time.format(context));
          }
        }
      },
    );
  }
}
