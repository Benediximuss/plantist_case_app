import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/credentials_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/color_manager.dart';
import 'package:plantist_case_app/temp/text_styles.dart';
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Enter you email and password',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.headlineMedium,
                        controller: controller.emailController,
                        // focusNode: _usernameFocus,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: ColorManager.gray,
                              ),
                          suffixIcon: Obx(() => controller.isEmailValid ? const Icon(CupertinoIcons.checkmark_alt_circle_fill) : const SizedBox.shrink()),
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
                              style: Theme.of(context).textTheme.headlineMedium,
                              controller: controller.passwordController,
                              obscureText: controller.isPasswordHidden,
                              decoration: InputDecoration(
                                counter: TextButton(
                                  onPressed: () => Get.toNamed(AppRoutes.resetPasswordScreen),
                                  child: Text(
                                    'Forgot password?',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue,
                                        ),
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                      color: ColorManager.gray,
                                    ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordHidden ? Icons.visibility_off : Icons.visibility,
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
                                enabled: controller.isEmailValid && controller.isPasswordValid,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _onSubmitLogic();
                                },
                              ),
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
      ),
    );
  }

  void _onSubmitLogic() {
    controller.enableLoader();

    onPressedSubmit(
      email: controller.emailController.text,
      password: controller.passwordController.text,
    ).then((_) => onSuccessful()).whenComplete(() => controller.disableLoader());
  }
}
