import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/screens/templates/credentials_page_template.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CredentialsPageTemplate(
      title: 'Sign up',
      buttonText: 'Create Account',
      onPressedSubmit: _authController.signUp,
      // onPressedSubmit: ({required email, required password}) =>
      //     _authController.signUp(email: email, password: password),
      onSuccessful: () => Get.offAndToNamed(AppRoutes.signInScreen),
    );
  }
}
