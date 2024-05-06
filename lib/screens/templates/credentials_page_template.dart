import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/credentials_controller.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/dynamic_button.dart';
import 'package:plantist_case_app/widgets/loader_view.dart';

class CredentialsPageTemplate extends GetWidget<CredentialsController> {
  const CredentialsPageTemplate({
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderView(
        condition: controller.isLoading,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                      controller: controller.emailController,
                      // focusNode: _usernameFocus,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        suffixIcon: Obx(() => controller.isEmailValid
                            ? const Icon(
                                CupertinoIcons.checkmark_alt_circle_fill)
                            : const SizedBox.shrink()),
                        filled: true,
                      ),
                      onChanged: (value) => controller.validateEmail(),
                    ),
                    const SizedBox(height: 30),
                    Builder(
                      builder: (context) {
                        return Obx(
                          () => TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyles.inputText(),
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordHidden,
                            decoration: InputDecoration(
                              counterText: 'Forgot password?',
                              counterStyle: TextStyles.linkText(),
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                              ),
                              filled: true,
                            ),
                            onChanged: (value) => controller.validatePassword(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => DynamicButton(
                              text: buttonText,
                              enabled: controller.isEmailValid &&
                                  controller.isPasswordValid,
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                onSubmitLogic();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: DynamicButton(
                            text: 'DIRECT PASS',
                            enabled: true,
                            onPressed: () => onSuccessful(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmitLogic() {
    controller.enableLoader();

    onPressedSubmit(
      email: controller.emailController.text,
      password: controller.passwordController.text,
    ).then((_) {
      onSuccessful();
    }).whenComplete(() => controller.disableLoader());
  }
}
