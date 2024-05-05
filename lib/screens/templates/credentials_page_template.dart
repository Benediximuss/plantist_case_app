import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/screens/templates/credentials_controller.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/dynamic_button.dart';

class CredentialsPageTemplate extends StatelessWidget {
  CredentialsPageTemplate({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  final CredentialsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title with email',
                  style: TextStyles.titleText(),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter you email and password',
                  style: TextStyles.smallText(),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyles.inputText(),
                  // controller: _usernameController,
                  // focusNode: _usernameFocus,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    suffixIcon: GetBuilder<CredentialsController>(
                      builder: (controller) => controller.isEmailValid
                          ? const Icon(Icons.check_circle)
                          : const SizedBox.shrink(),
                    ),
                    filled: true,
                  ),
                  onChanged: (value) => _controller.validateEmail(value),
                ),
                //
                const SizedBox(height: 30),
                GetBuilder<CredentialsController>(
                  builder: (controller) => TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyles.inputText(),
                    //  controller: _userPasswordController,
                    obscureText: _controller.isPasswordHidden,
                    decoration: InputDecoration(
                      counterText: 'Forgot password?',
                      counterStyle: TextStyles.linkText(),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _controller.isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          _controller.togglePasswordVisibility();
                        },
                      ),
                      filled: true,
                    ),
                    onChanged: (value) => _controller.validatePassword(value),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<CredentialsController>(
                        builder: (controller) => DynamicButton(
                          text: buttonText,
                          enabled: controller.isEmailValid &&
                              controller.isPasswordValid,
                          onPressed: onPressed,
                        ),
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
}
