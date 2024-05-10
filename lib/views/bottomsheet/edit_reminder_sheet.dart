import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/edit_reminder_controller.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/views/bottomsheet/sheet1.dart';
import 'package:plantist_case_app/views/bottomsheet/sheet2.dart';
import 'package:plantist_case_app/utils/color_manager.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/loader_view.dart';

class EditReminderSheet extends GetWidget<EditReminderController> {
  final ReminderModel? reminder;
  final Future<void> Function({required ReminderModel reminder})
      onPressedSubmit;

  const EditReminderSheet({
    super.key,
    this.reminder,
    required this.onPressedSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final EditReminderController controller =
        Get.put<EditReminderController>(EditReminderController(reminder));

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Obx(
          () => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: LoaderView(
              condition: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          TextButton(
                            child: Text(
                              controller.pageIndex == 0 ? 'Cancel' : 'Back',
                              style: TextStyles.defaultText().copyWith(
                                color: Colors.blue,
                              ),
                            ),
                            onPressed: () => controller.pageIndex == 0
                                ? Get.back()
                                : controller.switchPage(),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            controller.pageIndex == 0
                                ? 'New Reminder'
                                : 'Details',
                            style: TextStyles.defaultTextBold(),
                          ),
                          Expanded(child: Container()),
                          TextButton(
                            onPressed: controller.isReminderValid
                                ? () {
                                    FocusScope.of(context).unfocus();
                                    controller.enableLoader();
                                    onPressedSubmit(
                                            reminder: controller
                                                .generateReminder(reminder))
                                        .then((_) => Get.back())
                                        .whenComplete(
                                            () => controller.disableLoader());
                                  }
                                : null,
                            child: Text(
                              reminder != null ? 'Update' : 'Add',
                              style: TextStyles.defaultTextBold().copyWith(
                                color: controller.isReminderValid
                                    ? Colors.blue
                                    : ColorManager.gray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: (index) =>
                              controller.pageIndex = index,
                          children: const [
                            Sheet1(),
                            Sheet2(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
