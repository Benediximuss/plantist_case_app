import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/services/auth_controller.dart';
import 'package:plantist_case_app/controllers/reminders_controller.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/controllers/services/storage_controller.dart';
import 'package:plantist_case_app/views/bottomsheets/edit_reminder_sheet.dart';
import 'package:plantist_case_app/views/listviews/reminder_list_view.dart';
import 'package:plantist_case_app/widgets/custom_icon_button.dart';
import 'package:plantist_case_app/widgets/elevated_icon.dart';

class HomeScreen extends GetWidget<RemindersController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Plantist',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.logout_rounded,
                            weight: 0.1,
                            size: Theme.of(context).textTheme.headlineLarge!.fontSize,
                          ),
                          onPressed: () => _onLogOutPressed(),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (controller.reminders.isEmpty) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ElevatedIcon(
                              iconData: Icons.checklist_rounded,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'No reminders here!',
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    color: Colors.black54,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ReminderListView(
                          reminderList: controller.reminders,
                          onEditAction: _showReminderSheet,
                          onDeleteAction: _deleteReminder,
                          onCompleteAction: _completeReminder,
                        ),
                      );
                    }
                  }),
                  // const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomIconButton(
                            text: 'New Reminder',
                            onPressed: _showReminderSheet,
                            icon: Icons.add_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogOutPressed() {
    Get.find<AuthController>().signOut().then(
          (_) => Get.offAllNamed(AppRoutes.welcomeScreen),
        );
  }

  void _completeReminder(ReminderModel reminder) {
    Get.find<StorageController>().completeReminder(reminder);
  }

  void _deleteReminder(ReminderModel reminder) {
    Get.find<StorageController>().deleteReminder(reminder.id!);
  }

  void _showReminderSheet({ReminderModel? reminder}) {
    Get.bottomSheet(
      EditReminderSheet(
        reminder: reminder,
        onPressedSubmit: Get.find<StorageController>().postReminder,
      ),
    );
  }
}
