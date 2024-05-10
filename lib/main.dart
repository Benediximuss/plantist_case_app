import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/bindings/auth_binding.dart';
import 'package:plantist_case_app/firebase_options.dart';
import 'package:plantist_case_app/routes/app_pages.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/utils/themes.dart';
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
      textTheme: TextTheme(
        labelLarge: TextStyles.slideMenuText(),
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
}
