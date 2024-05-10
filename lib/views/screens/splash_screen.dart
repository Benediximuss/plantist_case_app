import 'package:flutter/material.dart';
import 'package:plantist_case_app/widgets/custom_progress_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomProgressIndicator(),
      ),
    );
  }
}
