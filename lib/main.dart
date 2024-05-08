import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/bindings/auth_binding.dart';
import 'package:plantist_case_app/firebase_options.dart';
import 'package:plantist_case_app/routes/app_pages.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  AppPages.initial = AppRoutes.splashScreen;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantist App',
      theme: ThemeData(
        textTheme: TextTheme(
          labelLarge: TextStyles.slidemenuText(),
        ),
        colorScheme: ColorSchemes.mainTheme(),
      ),
      initialRoute: AppPages.initial,
      initialBinding: AuthBinding(),
      getPages: AppPages.pages,
    );
  }
}
