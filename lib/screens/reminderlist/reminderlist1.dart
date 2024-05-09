import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/screens/reminderlist/reminder_card.dart';

class ReminderList1 extends StatelessWidget {
  final List<ReminderModel> reminderList;
  final void Function({ReminderModel? reminder}) onEditAction;
  final void Function(ReminderModel) onDeleteAction;

  const ReminderList1({
    super.key,
    required this.reminderList,
    required this.onEditAction,
    required this.onDeleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        itemCount: reminderList.length,
        itemBuilder: (_, index) => ReminderCard(
          reminder: reminderList[index],
          onEdit: () => onEditAction(reminder: reminderList[index]),
          onDelete: () => onDeleteAction(reminderList[index]),
          onComplete: () {},
        ),
      ),
    );
  }
}
