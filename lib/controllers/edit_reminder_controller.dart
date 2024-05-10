import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/models/reminder_model.dart';

class EditReminderController extends GetxController {
  final ReminderModel? reminder;

  EditReminderController(this.reminder);

  final PageController pageController = PageController(initialPage: 0);
  final Rx<int> _pageIndex = Rx<int>(0);

  final GlobalKey<PopupMenuButtonState> popUpMenuController = GlobalKey<PopupMenuButtonState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final Rx<int> _priority = Rx<int>(0);
  final Rx<bool> _dateSwitch = Rx<bool>(false);
  final Rx<bool> _timeSwitch = Rx<bool>(false);
  final Rx<DateTime> _selectedDate = Rx<DateTime>(DateTime.now());
  final Rx<TimeOfDay> _selectedTime = Rx<TimeOfDay>(TimeOfDay.now());

  final Rx<bool> _isReminderValid = Rx<bool>(false);
  final Rx<bool> _isLoading = Rx<bool>(false);

  int get priority => _priority.value;
  DateTime get selectedDate => _selectedDate.value;
  TimeOfDay get selectedTime => _selectedTime.value;
  bool get dateSwitch => _dateSwitch.value;
  bool get timeSwitch => _timeSwitch.value;
  bool get isReminderValid => _isReminderValid.value;
  bool get isLoading => _isLoading.value;
  int get pageIndex => _pageIndex.value;

  set priority(int value) => _priority.value = value;
  set selectedDate(DateTime value) => _selectedDate.value = value;
  set selectedTime(TimeOfDay value) => _selectedTime.value = value;
  set dateSwitch(bool value) => _dateSwitch.value = value;
  set timeSwitch(bool value) => _timeSwitch.value = value;
  set pageIndex(int value) => _pageIndex.value = value;

  final priorityList = [
    {'label': 'None', 'value': 0},
    {'label': 'Low', 'value': 1},
    {'label': 'Medium', 'value': 2},
    {'label': 'High', 'value': 3},
  ];

  @override
  void onInit() {
    if (reminder != null) _initReminderValues(reminder!);
    super.onInit();
  }

  void _initReminderValues(ReminderModel reminder) {
    titleController.text = reminder.title;
    noteController.text = reminder.note ?? '';
    if (reminder.due != null) {
      _dateSwitch.value = true;
      _selectedDate.value = reminder.due!.toDate();
      if (reminder.timeInDue) {
        _timeSwitch.value = true;
        _selectedTime.value = TimeOfDay.fromDateTime(reminder.due!.toDate());
      }
    }
    _priority.value = reminder.priority;
    validateTitle();
  }

  void validateTitle() {
    _isReminderValid.value = titleController.text.trim().isNotEmpty;
  }

  void switchPage() {
    pageController.animateToPage(
      1 - _pageIndex.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void enableLoader() {
    _isLoading.value = true;
  }

  void disableLoader() {
    _isLoading.value = false;
  }

  ReminderModel generateReminder(ReminderModel? reminder) {
    if (dateSwitch && timeSwitch) {
      _selectedDate.value = DateTime(
        _selectedDate.value.year,
        _selectedDate.value.month,
        _selectedDate.value.day,
        _selectedTime.value.hour,
        _selectedTime.value.minute,
      );
    }

    return ReminderModel(
      id: reminder?.id,
      title: titleController.text.trim(),
      priority: priority,
      completed: reminder?.completed ?? false,
      note: noteController.text.trim().isNotEmpty ? noteController.text.trim() : null,
      due: dateSwitch ? Timestamp.fromDate(selectedDate) : null,
      timeInDue: dateSwitch && timeSwitch,
    );
  }
}
