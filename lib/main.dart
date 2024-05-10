import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantist_case_app/controllers/bindings/auth_binding.dart';
import 'package:plantist_case_app/firebase_options.dart';
import 'package:plantist_case_app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/color_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantist App',
      theme: mainTheme(),
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      initialBinding: AuthBinding(),
    );
  }

  ThemeData mainTheme() {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: newMethod(),
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

  static const String _fontFamily = 'Inter';

  TextTheme newMethod() {
    return TextTheme(
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
        //slide menu text
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
    );
  }
}
