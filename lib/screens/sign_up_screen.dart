import 'package:flutter/material.dart';
import 'package:plantist_case_app/screens/templates/credential_page_template.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CredentialPageTemplate(
      title: 'Sign up',
      buttonText: 'Create Account',
      onPressed: () {},
    );
  }
}
