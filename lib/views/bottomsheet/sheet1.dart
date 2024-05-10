import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/edit_reminder_controller.dart';
import 'package:plantist_case_app/utils/color_manager.dart';
import 'package:plantist_case_app/utils/date_time_utils.dart';
import 'package:plantist_case_app/temp/text_styles.dart';

class Sheet1 extends GetWidget<EditReminderController> {
  const Sheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.titleController,
              style: Theme.of(context).textTheme.bodyMedium,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.gray,
                    ),
                filled: true,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.gray,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) => controller.validateTitle(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.noteController,
              style: Theme.of(context).textTheme.bodyMedium,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Notes',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.gray,
                    ),
                filled: true,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.gray,
                    width: 1,
                  ),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.gray.withOpacity(0.5),
                  strokeAlign: BorderSide.strokeAlignCenter,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Obx(
                        () => controller.dateSwitch
                            ? Text(
                                DateTimeUtils.getDayTitle(DateTimeUtils.dateToDay(controller.selectedDate)),
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorManager.gray,
                      size: 24,
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.switchPage();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
