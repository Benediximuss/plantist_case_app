import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/controllers/reset_password_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/dynamic_button.dart';
import 'package:plantist_case_app/widgets/loader_view.dart';

class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

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
                        'Reset password',
                        style: TextStyles.titleText(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Enter you email to send a password reset email',
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
                          hintStyle: TextStyles.placeHolderText(),
                          suffixIcon: Obx(() => controller.isEmailValid
                              ? const Icon(
                                  CupertinoIcons.checkmark_alt_circle_fill)
                              : const SizedBox.shrink()),
                          filled: true,
                        ),
                        onChanged: (value) => controller.validateEmail(),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => DynamicButton(
                                text: 'Reset',
                                enabled: controller.isEmailValid,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _onSubmitLogic();
                                },
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
      ),
    );
  }

  void _onSubmitLogic() {
    controller.enableLoader();

    Get.find<AuthController>()
        .resetPassword(
      email: controller.emailController.text,
    )
        .then(
      (_) {
        NotificationUtils.showCustomSnackbar(
          title: "Success",
          message: 'Password reset email sent!',
        );
        Get.until((route) => Get.currentRoute == AppRoutes.welcomeScreen);
      },
    ).whenComplete(() => controller.disableLoader());
  }
}
