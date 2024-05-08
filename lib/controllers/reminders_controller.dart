import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/controllers/storage_controller.dart';
import 'package:plantist_case_app/models/reminder_model.dart';

class RemindersController extends GetxController {
  late final Rx<List<ReminderModel>> _reminderList =
      Rx<List<ReminderModel>>(<ReminderModel>[]);

  List<ReminderModel> get reminders => _reminderList.value;

  @override
  void onInit() {
    super.onInit();
    _bindReminders();
  }

  void _bindReminders() {
    String uid = Get.find<AuthController>().activeUser!.uid;
    _reminderList.bindStream(Get.find<StorageController>().reminderStream(uid));
  }
}
