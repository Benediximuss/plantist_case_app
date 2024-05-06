import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredentialsController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Rx<bool> _isEmailValid = Rx<bool>(false);
  final Rx<bool> _isPasswordValid = Rx<bool>(false);
  final Rx<bool> _isPasswordHidden = Rx<bool>(true);
  final Rx<bool> _isLoading = Rx<bool>(false);

  bool get isEmailValid => _isEmailValid.value;
  bool get isPasswordValid => _isPasswordValid.value;
  bool get isPasswordHidden => _isPasswordHidden.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'ugur@gma.com';
    passwordController.text = '123456';
    _isPasswordValid.value = true;
    _isEmailValid.value = true;
  }

  

  void validateEmail() {
    _isEmailValid.value = GetUtils.isEmail(emailController.text);
  }

  void validatePassword() {
    _isPasswordValid.value = passwordController.text.length >= 6;
  }

  void togglePasswordVisibility() {
    _isPasswordHidden.value = !_isPasswordHidden.value;
  }

  void enableLoader() {
    _isLoading.value = true;
  }

  void disableLoader() {
    _isLoading.value = false;
  }
}
