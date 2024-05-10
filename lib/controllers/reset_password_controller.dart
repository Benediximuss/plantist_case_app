import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final Rx<bool> _isEmailValid = Rx<bool>(false);
  final Rx<bool> _isLoading = Rx<bool>(false);

  bool get isEmailValid => _isEmailValid.value;
  bool get isLoading => _isLoading.value;

  void validateEmail() {
    _isEmailValid.value = GetUtils.isEmail(emailController.text);
  }

  void enableLoader() {
    _isLoading.value = true;
  }

  void disableLoader() {
    _isLoading.value = false;
  }
}
