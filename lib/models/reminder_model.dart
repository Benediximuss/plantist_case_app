import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderModel {
  String? id;
  String title;
  int priority;
  bool completed;
  String? note;
  Timestamp? due;
  bool timeInDue;

  ReminderModel({
    this.id,
    required this.title,
    required this.priority,
    required this.completed,
    this.note,
    this.due,
    this.timeInDue = false,
  });

  factory ReminderModel.fromDocumentSnapshot(
      /* QueryDocumentSnapshot<Object?> element, */
      {required DocumentSnapshot documentSnapshot}) {
    return ReminderModel(
      id: documentSnapshot.id,
      title: documentSnapshot['title'],
      priority: documentSnapshot["priority"],
      completed: documentSnapshot["completed"],
      note: documentSnapshot['note'],
      due: documentSnapshot['due'],
      timeInDue: documentSnapshot['timeInDue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'priority': priority,
      'completed': completed,
      'note': note,
      'due': due,
      'timeInDue': timeInDue,
    };
  }
}

enum Priorities {
  None,
  Low,
  Medium,
  High,
}
