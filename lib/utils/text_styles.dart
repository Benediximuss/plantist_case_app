import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantist_case_app/utils/colors.dart';

// @immutable
// class CustomTextTheme {
//   const CustomTextTheme._();

//   static late final mainTextTheme = TextTheme(
//     displayLarge: ,
//     displayMedium: ,
//     displaySmall: ,
//     headlineLarge: ,
//     headlineMedium: ,
//     headlineSmall: ,
//     titleLarge: ,
//     titleMedium: ,
//     titleSmall: ,
//     bodyLarge: ,
//     bodyMedium: ,
//     bodySmall: ,
//     labelLarge: ,
//     labelMedium:,
//     labelSmall: ,
//   );
// }

class TextStyles {
  const TextStyles._();

  static const String _fontFamily = 'Inter';

  static TextStyle buttonText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: ColorConsts.indigo,
    );
  }

  static TextStyle captionText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: ColorConsts.gray,
    );
  }

  static TextStyle captionTextHighlighted() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: ColorConsts.indigo,
    );
  }

  static TextStyle titleText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 35,
      fontWeight: FontWeight.w500,
      color: ColorConsts.indigo,
    );
  }

  static TextStyle titleTextSlender() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: ColorConsts.black,
    );
  }

  static TextStyle titleTextBig() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorConsts.black,
    );
  }

  static TextStyle smallText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorConsts.gray,
    );
  }

  // static TextStyle placeHolderText() {
  //   return GoogleFonts.getFont(_fontFamily, fontSize: , fontWeight: ,);
  // }

  static TextStyle inputText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle linkText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    );
  }

  static TextStyle defaultText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: ColorConsts.black,
    );
  }

  static TextStyle defaultTextSecondary() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: ColorConsts.gray,
    );
  }
  
  static TextStyle slidemenuText() {
    return GoogleFonts.getFont(
      _fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
  }
}
