import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

class ReminderCard extends StatelessWidget {
  final ReminderModel reminder;

  const ReminderCard({
    super.key,
    required this.reminder,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      // elevation: 1,
      // color: Colors.green[50],
      

      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.circle,
              color: Colors.amber[600],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                // color: Colors.green[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evening zoom call',
                      style: TextStyles.defaultText(),
                    ),
                    Text(
                      'Reminders',
                      style: TextStyles.defaultTextSecondary(),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        IconText(
                          text: '27.01.2024',
                          icon: CupertinoIcons.calendar,
                          textStyle: TextStyles.defaultTextSecondary(),
                        ),
                        const SizedBox(width: 10),
                        IconText(
                          text: '17:15',
                          icon: Icons.watch_later_outlined,
                          textStyle: TextStyles.defaultTextSecondary().copyWith(
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            )

            // Expanded(
            //   child: Text(
            //     reminder.note,
            //     style: const TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Checkbox(
            //   value: reminder.completed,
            //   onChanged: (newValue) {
            //     // Get.find<StorageController>().updateTodo(newValue, uid, reminder.todoId);
            //   },
            // ),
            // IconButton(
            //   onPressed: () =>
            //       Get.find<StorageController>().deleteItem(reminder.id!),
            //   icon: const Icon(
            //     CupertinoIcons.delete_simple,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle textStyle;

  const IconText({
    super.key,
    required this.text,
    required this.icon,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: textStyle.color,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
