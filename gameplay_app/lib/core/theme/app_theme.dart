import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.boxes1,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.boxes1,
      surfaceTintColor: Colors.white,
      dayStyle: const TextStyle(
        color: Colors.white,
      ),
      weekdayStyle: const TextStyle(
        color: Colors.white,
      ),
      yearStyle: const TextStyle(
        color: Colors.white,
      ),
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return Colors.white;
      }),
      yearForegroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      headerForegroundColor: Colors.white,
      rangePickerHeaderForegroundColor: Colors.white,
      todayForegroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      rangeSelectionOverlayColor:
          const MaterialStatePropertyAll<Color>(Colors.white),
      rangePickerSurfaceTintColor: Colors.white,
      dayOverlayColor: const MaterialStatePropertyAll<Color>(AppColors.boxes2),
      headerHeadlineStyle: const TextStyle(
        color: Colors.white,
      ),
      headerHelpStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.boxes1,
      dialBackgroundColor: AppColors.boxes2,
      dialTextColor: Colors.white,
      dialTextStyle: TextStyle(
        color: Colors.white,
      ),
      dayPeriodColor: AppColors.boxes2,
      dayPeriodTextColor: Colors.white,
      hourMinuteColor: AppColors.boxes2,
      hourMinuteTextColor: Colors.white,
      timeSelectorSeparatorColor: MaterialStatePropertyAll(
        Colors.white,
      ),
      helpTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    useMaterial3: true,
  );
}
