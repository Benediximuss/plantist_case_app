import 'package:get/get.dart';

class CredentialsController extends GetxController {
  late bool isEmailValid;
  late bool isPasswordValid;
  late bool isPasswordHidden;
  late bool isLoading;

  @override
  void onInit() {
    super.onInit();
    initValues();
  }

  void initValues() {
    isEmailValid = false;
    isPasswordValid = false;
    isPasswordHidden = true;
    isLoading = false;
  }

  void validateEmail(String value) {
    isEmailValid = GetUtils.isEmail(value);
    update();
  }

  void validatePassword(String value) {
    isPasswordValid = value.length >= 6;
    update();
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  void enableLoader() {
    isLoading = true;
    update();
  }

  void disableLoader() {
    isLoading = false;
    update();
  }
}
