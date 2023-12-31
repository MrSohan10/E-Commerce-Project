import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData {

  static  ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primaryColor,
        seedColor: AppColors.primaryColor,
        background: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade500,
        ),
      ),
      inputDecorationTheme:  InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.grey.shade400
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: Colors.red),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      )
    // primarySwatch: MaterialColor(
    //   AppColors.primaryColor.value,
    //   AppColors.colorSwatch,
    // ),
  );
}