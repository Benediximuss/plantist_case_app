import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/storage_controller.dart';

class StorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageController>(() => StorageController());
  }
}
