import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/reminders_controller.dart';

class RemindersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemindersController>(() => RemindersController());
  }
}
