import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/credentials_controller.dart';

class CredentialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CredentialsController>(() => CredentialsController());
  }
}
