import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/screens/templates/credential_page_template.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CredentialPageTemplate(
      title: 'Sign in',
      buttonText: 'Sign In',
      onPressed: () {
        print("3131: pressed!");
        Get.offAndToNamed(AppRoutes.homeScreen);
      },
    );
  }
}
