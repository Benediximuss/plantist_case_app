import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/bindings/credentials_binding.dart';
import 'package:plantist_case_app/controllers/bindings/reminders_binding.dart';
import 'package:plantist_case_app/controllers/bindings/reset_password_binding.dart';
import 'package:plantist_case_app/controllers/bindings/storage_binding.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/views/screens/home_screen.dart';
import 'package:plantist_case_app/views/screens/reset_password_screen.dart';
import 'package:plantist_case_app/views/screens/sign_in_screen.dart';
import 'package:plantist_case_app/views/screens/sign_up_screen.dart';
import 'package:plantist_case_app/views/screens/splash_screen.dart';
import 'package:plantist_case_app/views/screens/welcome_screen.dart';

class AppPages {
  const AppPages._();

  static const String initial = AppRoutes.splashScreen;

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        CredentialsBinding(),
        StorageBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => SignInScreen(),
      binding: CredentialsBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        StorageBinding(),
        RemindersBinding(),
      ],
    ),
  ];
}
