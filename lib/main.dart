import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_pages.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/themes.dart';

void main() {
  AppPages.initial = AppRoutes.welcomeScreen;

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
        colorScheme: ColorSchemes.mainTheme(),
      ),
      initialRoute: AppPages.initial,
      // initialBinding: UpcomingMovieBinding(),
      getPages: AppPages.pages,

      // initialRoute: AppRouter.initialRoute,
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
