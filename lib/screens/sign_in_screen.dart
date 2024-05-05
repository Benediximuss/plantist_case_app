import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/screens/templates/credentials_page_template.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CredentialsPageTemplate(
      title: 'Sign in',
      buttonText: 'Sign In',
      onPressed: () {
        Get.offAndToNamed(AppRoutes.homeScreen);
      },
    );
  }
}
