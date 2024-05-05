import 'package:get/get.dart';
import 'package:plantist_case_app/screens/templates/credentials_controller.dart';

class CredentialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CredentialsController());
  }
}
