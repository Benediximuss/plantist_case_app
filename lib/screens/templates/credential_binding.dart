import 'package:get/get.dart';
import 'package:plantist_case_app/screens/templates/credential_controller.dart';

class CredentialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CredentialController());
  }
}
