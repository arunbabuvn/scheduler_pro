import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    tooltipTheme: const TooltipThemeData(
      decoration: BoxDecoration(color: AppColors.primaryColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.lightBackgroundColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      type: BottomNavigationBarType.fixed,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
    ),
  );
}
