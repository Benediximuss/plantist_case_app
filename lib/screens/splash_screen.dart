import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';

class SplashScreen extends GetWidget<AuthController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
