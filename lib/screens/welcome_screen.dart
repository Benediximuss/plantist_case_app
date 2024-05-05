import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/asset_manager.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/custom_icon_button.dart';
import 'package:simple_shadow/simple_shadow.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 50.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SimpleShadow(
                  opacity: 0.3, // Default: 0.5
                  color: Colors.black, // Default: Black
                  offset: const Offset(0, 10), // Default: Offset(2, 2)
                  sigma: 7,
                  child: Image.asset(
                    AssetManager.logoWelcomeScreen,
                    width: 350,
                    height: 350,
                  ), // Default: 2
                ),
                Text(
                  'Welcome back to',
                  style: TextStyles.titleTextSlender(),
                ),
                Text(
                  'Plantist',
                  style: TextStyles.titleTextBig(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Start your productive life now!',
                  style: TextStyles.smallText(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomIconButton(
                        text: 'Sign in with email',
                        icon: Icons.mail_rounded,
                        onPressed: () => _signInPressed(context),
                        lightMode: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t you have an account?',
                      style: TextStyles.captionText(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => _signUpPressed(context),
                      child: Text(
                        'Sign Up',
                        style: TextStyles.captionTextHighlighted(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInPressed(BuildContext context) {
    Get.toNamed(AppRoutes.signInScreen);
  }

  void _signUpPressed(BuildContext context) {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
