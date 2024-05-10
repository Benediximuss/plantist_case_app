import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/edit_reminder_controller.dart';
import 'package:plantist_case_app/utils/color_manager.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

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
              style: TextStyles.defaultText(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyles.defaultTextPlaceholder(),
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
              style: TextStyles.defaultText(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Notes',
                hintStyle: TextStyles.defaultTextPlaceholder(),
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
                        style: TextStyles.defaultText(),
                      ),
                      Text(
                        'Today',
                        style: TextStyles.defaultTextSecondary()
                            .copyWith(fontSize: 15),
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
