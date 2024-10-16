import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/services/auth_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/views/screens/templates/credentials_page_template.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CredentialsPageTemplate(
      title: 'Sign in',
      buttonText: 'Sign In',
      onPressedSubmit: _authController.signIn,
      onSuccessful: () => Get.offAndToNamed(AppRoutes.homeScreen),
    );
  }
}
