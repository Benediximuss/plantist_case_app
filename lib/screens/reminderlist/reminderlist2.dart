import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/screens/reminderlist/reminder_card.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:plantist_case_app/utils/date_utils.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

class ReminderList2 extends StatelessWidget {
  final List<ReminderModel> reminderList;
  final void Function({ReminderModel? reminder}) onEditAction;
  final void Function(ReminderModel) onDeleteAction;
  final void Function(ReminderModel) onCompleteAction;

  const ReminderList2({
    super.key,
    required this.reminderList,
    required this.onEditAction,
    required this.onDeleteAction,
    required this.onCompleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: GroupedListView<ReminderModel, String?>(
        elements: reminderList,
        groupBy: (element) => element.due != null
            ? DateTimeUtils.dateToDay(element.due!.toDate())
            : null,
        groupComparator: (value1, value2) =>
            DateTimeUtils.compareNullableDates(value1, value2),
        itemComparator: (element1, element2) {
          int res;

          if (element1.completed == element2.completed) {
            res =
                DateTimeUtils.compareNullableDates(element1.due, element2.due);

            if (res != 0) {
              return res;
            } else {
              res = element2.priority.compareTo(element1.priority);
              if (res != 0) {
                return res;
              } else {
                return element1.title.compareTo(element2.title);
              }
            }
          } else if (element1.completed) {
            return 1;
          } else {
            // element2.completed
            return -1;
          }
        },
        order: GroupedListOrder.ASC,
        // useStickyGroupSeparators: true,
        itemBuilder: (_, element) => ReminderCard(
          reminder: element,
          onEdit: () => onEditAction(reminder: element),
          onDelete: () => onDeleteAction(element),
          onComplete: () => onCompleteAction(element),
        ),
        groupSeparatorBuilder: (value) => Container(
          // color: Colors.green[200],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 15, 0),
            child: Text(
              value != null ? DateTimeUtils.getDayTitle(value) : 'No date',
              style: TextStyles.defaultTextSecondary().copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
