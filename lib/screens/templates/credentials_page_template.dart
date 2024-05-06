import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/controllers/credentials_controller.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/dynamic_button.dart';
import 'package:plantist_case_app/widgets/loader_view.dart';

class CredentialsPageTemplate extends StatelessWidget {
  CredentialsPageTemplate({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onPressedSubmit,
    required this.onSuccessful,
  });

  final String title;
  final String buttonText;
  final Future<void> Function({
    required String email,
    required String password,
  }) onPressedSubmit;
  final VoidCallback onSuccessful;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final CredentialsController _credController = Get.find();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CredentialsController>(
      builder: (controller) => LoaderView(
        condition: _credController.isLoading,
        child: Scaffold(
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
                      controller: _emailController,
                      // focusNode: _usernameFocus,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        suffixIcon: GetBuilder<CredentialsController>(
                          builder: (controller) => _credController.isEmailValid
                              ? const Icon(Icons.check_circle)
                              : const SizedBox.shrink(),
                        ),
                        filled: true,
                      ),
                      onChanged: (value) =>
                          _credController.validateEmail(value),
                    ),
                    //
                    const SizedBox(height: 30),
                    GetBuilder<CredentialsController>(
                      builder: (controller) => TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyles.inputText(),
                        controller: _passwordController,
                        obscureText: _credController.isPasswordHidden,
                        decoration: InputDecoration(
                          counterText: 'Forgot password?',
                          counterStyle: TextStyles.linkText(),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _credController.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              _credController.togglePasswordVisibility();
                            },
                          ),
                          filled: true,
                        ),
                        onChanged: (value) =>
                            _credController.validatePassword(value),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: GetBuilder<CredentialsController>(
                            builder: (controller) => DynamicButton(
                              text: buttonText,
                              enabled: _credController.isEmailValid &&
                                  _credController.isPasswordValid,
                              onPressed: () => onSubmitLogic(),
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
        ),
      ),
    );
  }

  Future<void> onSubmitLogic() async {
    _credController.enableLoader();

    await onPressedSubmit(
      email: _emailController.text,
      password: _passwordController.text,
    );

    _credController.disableLoader();

    if (_authController.inside) onSuccessful();
  }
}
