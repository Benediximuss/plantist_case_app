import 'package:get/get.dart';

class CredentialController extends GetxController {
  late bool isEmailValid;
  late bool isPasswordValid;
  late bool isPasswordHidden;

  @override
  void onInit() {
    super.onInit();
    initValues();
  }

  void initValues() {
    isEmailValid = false;
    isPasswordValid = false;
    isPasswordHidden = true;
  }

  void validateEmail(String value) {
    isEmailValid = GetUtils.isEmail(value);
    update();
  }

  void validatePassword(String value) {
    isPasswordValid = value.length > 6;
    update();
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    if (isPasswordHidden) {
      print("3131: true");
    } else {
      print("3131: false");
    }
    update();
  }
}
