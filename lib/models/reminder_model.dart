// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderModel {
  String? id;
  int priority;
  String title;
  String note;
  Timestamp due;
  bool completed;

  ReminderModel({
    this.id,
    required this.priority,
    required this.title,
    required this.note,
    required this.due,
    required this.completed,
  });

  factory ReminderModel.fromDocumentSnapshot(
      /* QueryDocumentSnapshot<Object?> element, */
      {required DocumentSnapshot documentSnapshot}) {
    return ReminderModel(
      id: documentSnapshot.id,
      priority: documentSnapshot["priority"],
      title: documentSnapshot['title'],
      note: documentSnapshot['note'],
      due: documentSnapshot['due'],
      completed: documentSnapshot['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'priority': priority,
      'title': title,
      'note': note,
      'due': due,
      'completed': completed,
    };
  }
}

enum Priorities {
  None,
  Low,
  Medium,
  High,
}
