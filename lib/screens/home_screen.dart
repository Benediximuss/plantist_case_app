import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/controllers/reminders_controller.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/controllers/storage_controller.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/custom_icon_button.dart';
import 'package:plantist_case_app/widgets/reminder_card.dart';

class HomeScreen extends GetWidget<RemindersController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Plantist',
                      style: TextStyles.titleTextBig(),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.check_circle,
                            color: Get.find<AuthController>().activeUser != null
                                ? Colors.green
                                : Colors.grey,
                            size: TextStyles.titleTextBig().fontSize!,
                          ),
                          onPressed: () => NotificationUtils.showCustomSnackbar(
                              title: 'Welcome back!',
                              message: Get.find<AuthController>()
                                      .activeUser
                                      ?.email ??
                                  'null'),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.search,
                            weight: 0.7,
                            size: TextStyles.titleTextBig().fontSize!,
                          ),
                          onPressed: () {
                            print('Search button pressed');
                          },
                        ),
                        const SizedBox(width: 10),
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 15),
                    child: ListView.builder(
                      itemCount: controller.reminders.length,
                      itemBuilder: (_, index) {
                        return ReminderCard(
                          reminder: controller.reminders[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomIconButton(
                        text: 'New Reminder',
                        onPressed: _postLogic,
                        icon: Icons.add_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogOutPressed() {
    Get.find<AuthController>()
        .signOut()
        .then((_) => Get.offAllNamed(AppRoutes.welcomeScreen));
  }

  void _postLogic() {
    Get.find<StorageController>().postNewItem();
  }
}
