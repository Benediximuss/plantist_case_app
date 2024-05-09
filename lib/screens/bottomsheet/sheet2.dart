import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plantist_case_app/controllers/edit_reminder_controller.dart';
import 'package:plantist_case_app/utils/colors.dart';
import 'package:plantist_case_app/utils/text_styles.dart';
import 'package:plantist_case_app/widgets/reminder_card.dart';

class Sheet2 extends GetWidget<EditReminderController> {
  const Sheet2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: TextStyles.defaultText().fontSize! * 1.5,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyles.defaultText(),
                          ),
                          Obx(
                            () => controller.dateSwitch
                                ? Text(
                                    DateFormat('dd.MM.yyyy')
                                        .format(controller.selectedDate),
                                    style: TextStyles.defaultTextSecondary(),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Obx(
                        () => Switch(
                          value: controller.dateSwitch,
                          onChanged: (value) => controller.dateSwitch = value,
                          activeColor: Colors.green[400],
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => controller.dateSwitch
                        ? SizedBox(
                            height: 200,
                            child: CalendarDatePicker(
                              initialDate: controller.selectedDate,
                              firstDate: controller.selectedDate
                                  .subtract(const Duration(days: 365 * 10)),
                              lastDate: controller.selectedDate
                                  .add(const Duration(days: 365 * 10)),
                              onDateChanged: (date) =>
                                  controller.selectedDate = date,
                            ),
                          )
                        : Container(),
                  ),
                  Obx(
                    () => controller.dateSwitch
                        ? Column(
                            children: [
                              const Divider(),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.time,
                                    size: TextStyles.defaultText().fontSize! *
                                        1.5,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Time',
                                        style: TextStyles.defaultText(),
                                      ),
                                      Obx(
                                        () => controller.timeSwitch
                                            ? Text(
                                                '${controller.selectedTime.hour.toString().padLeft(2, '0')}:${controller.selectedTime.minute.toString().padLeft(2, '0')}',
                                                style: TextStyles
                                                    .defaultTextSecondary(),
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  const SizedBox(width: 10),
                                  Obx(
                                    () => Switch(
                                      value: controller.timeSwitch,
                                      onChanged: (value) {
                                        controller.timeSwitch = value;
                                        if (value) {
                                          showTimePicker(
                                            context: context,
                                            initialTime:
                                                controller.selectedTime,
                                            initialEntryMode:
                                                TimePickerEntryMode.input,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return MediaQuery(
                                                data: MediaQuery.of(context)
                                                    .copyWith(
                                                        alwaysUse24HourFormat:
                                                            true),
                                                child: child!,
                                              );
                                            },
                                          ).then((value) =>
                                              controller.selectedTime = value!);
                                        }
                                      },
                                      activeColor: Colors.green[400],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConsts.gray.withOpacity(0.5),
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
                        'Priority',
                        style: TextStyles.defaultText(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          controller.priorityList[controller.priority]['label']
                              as String,
                          style: TextStyles.defaultTextSecondary(),
                        ),
                      ),
                      PopupMenuButton<int>(
                        key: controller.popupMenuCtrl,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorConsts.gray,
                            size: 24,
                          ),
                          onPressed: () {
                            controller.popupMenuCtrl.currentState
                                ?.showButtonMenu();
                          },
                        ),
                        onSelected: (value) => controller.priority = value,
                        itemBuilder: (context) => controller.priorityList
                            .map(
                              (item) => PopupMenuItem<int>(
                                value: item['value'] as int,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(0.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            chooseColor(item['value'] as int),
                                      ),
                                      child: Icon(
                                        CupertinoIcons.circle_filled,
                                        color: Colors.white.withOpacity(0.9),
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      item['label'] as String,
                                      style: TextStyles.defaultText(),
                                    ),
                                    Expanded(child: Container()),
                                    if (item['value'] as int ==
                                        controller.priority)
                                      const Icon(
                                        CupertinoIcons.check_mark,
                                      )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
