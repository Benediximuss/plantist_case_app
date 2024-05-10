import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/services/auth_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/views/screens/templates/credentials_page_template.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CredentialsPageTemplate(
      title: 'Sign up',
      buttonText: 'Create Account',
      onPressedSubmit: _authController.signUp,
      onSuccessful: () {
        NotificationUtils.showCustomSnackbar(
          title: 'Success',
          message: 'Sign up Successful!',
        );

        Get.until((route) => Get.currentRoute == AppRoutes.welcomeScreen);
      },
    );
  }
}
