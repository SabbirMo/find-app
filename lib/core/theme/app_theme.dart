import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    //Text Field Theme
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
      labelStyle: TextStyle(
        color: Colors.white.withValues(alpha: 0.6),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      suffixIconColor: Colors.white.withValues(alpha: 0.6),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.2),
    ),

    // Button Theme
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.blue.withValues(alpha: 0.8),
        foregroundColor: Colors.white,
        fixedSize: Size.fromWidth(double.maxFinite),
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
