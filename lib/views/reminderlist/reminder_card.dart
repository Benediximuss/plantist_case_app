import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/temp/text_styles.dart';

class ReminderCard extends StatelessWidget {
  final ReminderModel reminder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onComplete;

  const ReminderCard({
    super.key,
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15),
      child: Slidable(
        key: ValueKey(reminder),
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(
            onDismissed: () => onDelete(),
          ),
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
              GestureDetector(
                onTap: () => onComplete(),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: chooseColor(reminder.priority),
                  ),
                  child: Icon(
                    reminder.completed
                        ? CupertinoIcons.checkmark_circle_fill
                        : CupertinoIcons.circle_filled,
                    color: Colors.white
                        .withOpacity(reminder.completed ? 0.5 : 0.9),
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints:
                                BoxConstraints.loose(const Size.fromHeight(25)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                reminder.title,
                                style: reminder.completed
                                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.grey[800],
                                        decorationThickness: 1.7,
                                      )
                                    : Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (reminder.note != null)
                            Container(
                              constraints: BoxConstraints.loose(
                                  const Size.fromHeight(100)),
                              child: SingleChildScrollView(
                                child: Text(
                                  reminder.note!,
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          const SizedBox(height: 15),
                          if (reminder.due != null)
                            Row(
                              children: [
                                IconText(
                                  text: DateFormat('dd.MM.yyyy')
                                      .format(reminder.due!.toDate()),
                                  icon: CupertinoIcons.calendar,
                                  textStyle: Theme.of(context).textTheme!.labelMedium!,
                                ),
                                const SizedBox(width: 15),
                                if (reminder.timeInDue)
                                  IconText(
                                    text: DateFormat('HH:mm')
                                        .format(reminder.due!.toDate()),
                                    icon: Icons.watch_later_outlined,
                                    textStyle: Theme.of(context).textTheme.labelMedium!
                                        .copyWith(
                                      color: Colors.red[300],
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
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

Color chooseColor(int pri) {
  late final Color ret;
  switch (pri) {
    case 0:
      ret = const Color(0xFFb7b7b9); // NONE
      break;
    case 1:
      ret = const Color(0xFF2a73e6); // LOW
      break;
    case 2:
      ret = const Color(0xFFe69340); // MEDIUM
      break;
    case 3:
      ret = const Color(0xFFd97c7d); // HIGH
  }
  return ret;
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
