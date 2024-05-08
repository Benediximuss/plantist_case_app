import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

class ReminderCard extends StatelessWidget {
  final ReminderModel reminder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReminderCard({
    super.key,
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onEdit(),
              backgroundColor: const Color(0xffb7b7b9),
              foregroundColor: Colors.white,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (_) => onDelete(),
              backgroundColor: const Color(0xFFf44837),
              foregroundColor: Colors.white,
              label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(0.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color(0xFFd97c7d), // HIGH
                  color: Color(0xFFe69340), // MEDIUM
                  // color: Color(0xFF2a73e6), // LOW
                  // color: Color(0xFFb7b7b9), // NONE
                ),
                child: Icon(
                  CupertinoIcons.circle_filled,
                  color: Colors.white.withOpacity(0.9),
                  size: 25,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evening zoom call',
                      style: TextStyles.defaultText(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Reminders',
                      style: TextStyles.defaultTextSecondary(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconText(
                          text: '27.01.2024',
                          icon: CupertinoIcons.calendar,
                          textStyle: TextStyles.defaultTextSecondary(),
                        ),
                        const SizedBox(width: 15),
                        IconText(
                          text: '17:15',
                          icon: Icons.watch_later_outlined,
                          textStyle: TextStyles.defaultTextSecondary().copyWith(
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      height: 0,
                      thickness: 0.75,
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
          size: textStyle.fontSize! * 1.25,
          color: textStyle.color,
        ),
        const SizedBox(width: 2.5),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
