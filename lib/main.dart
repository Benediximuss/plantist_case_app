import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/bindings/auth_binding.dart';
import 'package:plantist_case_app/firebase_options.dart';
import 'package:plantist_case_app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantist_case_app/utils/theme_manager.dart';


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
      theme: ThemeManager.mainTheme,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      initialBinding: AuthBinding(),
    );
  }
}
