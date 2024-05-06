import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/screens/home_screen.dart';
import 'package:plantist_case_app/screens/sign_in_screen.dart';
import 'package:plantist_case_app/screens/sign_up_screen.dart';
import 'package:plantist_case_app/controllers/bindings/credentials_binding.dart';
import 'package:plantist_case_app/screens/welcome_screen.dart';

class AppPages {
  static late final String initial;

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: CredentialsBinding(),
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => SignInScreen(),
      binding: CredentialsBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}
