import 'package:flutter/material.dart';
import 'package:plantist_case_app/utils/colors.dart';

class ColorSchemes {
  const ColorSchemes._();

  static ColorScheme mainTheme() {
    return ColorScheme(
      brightness: Brightness.light,
      // Button tint / InputField Bottom Frame When Focussed
      primary: Colors.grey[500]!,

      onPrimary: Colors.blue,
      secondary: Colors.amber,
      onSecondary: Colors.green,
      error: Colors.red,
      onError: Colors.orange,

      // InputField Bottom Frame When not Focussed
      onBackground: ColorConsts.gray,

      // Default text color / Icons color
      onSurface: ColorConsts.indigo,
      // onSurface: Color.fromRGBO(17, 26, 24, 1.0),

      // AppBar Color / PopUp Background Color
      surface: Colors.white,

      // Background color
      background: Colors.white,
    );
  }

  // static ColorScheme mainTheme() {
  //   return ColorScheme(
  //     brightness: brightness,
  //     primary: primary,
  //     onPrimary: onPrimary,
  //     secondary: secondary,
  //     onSecondary: onSecondary,
  //     error: error,
  //     onError: onError,
  //     background: background,
  //     onBackground: onBackground,
  //     surface: surface,
  //     onSurface: onSurface,
  //   );
  // }
}
