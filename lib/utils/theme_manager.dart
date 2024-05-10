import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantist_case_app/utils/color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static const String _fontFamily = 'Inter';

  static ThemeData mainTheme = ThemeData(
    textTheme: TextTheme(
      displayLarge: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 40,
        fontWeight: FontWeight.w300,
        color: ColorManager.black,
      ),
      displayMedium: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorManager.indigo,
      ),
      headlineLarge: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: ColorManager.black,
      ),
      headlineMedium: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: ColorManager.indigo,
      ),
      bodyMedium: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      ),
      bodySmall: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorManager.gray,
      ),
      labelLarge: GoogleFonts.getFont(
        // slide menu text
        _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: ColorManager.gray,
      ),
      labelSmall: GoogleFonts.getFont(
        _fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: ColorManager.gray,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.gray,
      onPrimary: ThemeData.light().colorScheme.onPrimary,
      secondary: ThemeData.light().colorScheme.secondary,
      onSecondary: ThemeData.light().colorScheme.onSecondary,
      error: ThemeData.light().colorScheme.error,
      onError: ThemeData.light().colorScheme.onError,
      background: Colors.white,
      onBackground: Colors.grey,
      surface: Colors.white,
      onSurface: ColorManager.indigo,
    ),
  );
}
