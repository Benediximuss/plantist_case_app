import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/controllers/reminders_controller.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/controllers/storage_controller.dart';
import 'package:plantist_case_app/screens/bottomsheet/edit_reminder_sheet.dart';
import 'package:plantist_case_app/screens/reminderlist/reminderlist2.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Plantist',
                          style: TextStyles.titleTextBig(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.logout_rounded,
                            weight: 0.1,
                            size: TextStyles.titleTextBig().fontSize!,
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
                            SizedBox(height: 30),
                            Text(
                              'No reminders here!',
                              style: TextStyles.buttonText().copyWith(
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ReminderList2(
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
