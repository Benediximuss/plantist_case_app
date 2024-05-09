import 'package:intl/intl.dart';

class DateTimeUtils {
  const DateTimeUtils._();

  static String dateToDay(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static DateTime dayToDate(String day) {
    return DateFormat('dd.MM.yyyy').parse(day);
  }

  static int compareNullableDates<T extends Comparable<T>>(
      T? value1, T? value2) {
    if (value1 != null && value2 != null) {
      return value1.compareTo(value2);
    } else if (value1 != null && value2 == null) {
      return 1;
    } else if (value1 == null && value2 != null) {
      return -1;
    } else {
      return 0;
    }
  }

  static String getDayTitle(String day) {
    DateTime date = DateFormat('dd.MM.yyyy').parse(day);
    DateTime now = DateTime.now();

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day + 1) {
      return 'Tomorrow';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return DateFormat('d MMMM').format(date);
    }
  }
}
