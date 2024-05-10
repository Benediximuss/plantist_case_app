import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/services/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
