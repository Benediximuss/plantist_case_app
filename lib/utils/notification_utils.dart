import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

class NotificationUtils {
  static void showCustomSnackbar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.inputText().copyWith(
          color: Colors.black87,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyles.smallText().copyWith(
          color: Colors.black54,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20.0),
      backgroundColor: const Color(0xFF646464).withOpacity(0.6),
      backgroundGradient: LinearGradient(
        colors: [
          const Color(0xFFC4C4C4).withOpacity(0.6), // Light grey
          const Color(0xFF646464).withOpacity(0.6), // Dark grey
          const Color(0xFF444444).withOpacity(0.6), // Even darker grey
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
  }

  static void showSmallSnackbar({
    required String title,
  }) {
    Get.snackbar(
      title,
      '',
      titleText: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.inputText().copyWith(
          color: Colors.black87,
        ),
      ),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutBack,
      duration: const Duration(seconds: 2),
      borderRadius: 50,
      // messageText: Text(
      //   '',
      //   style: TextStyles.smallText(),
      // ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      backgroundGradient: LinearGradient(
        colors: [
          const Color(0xFFC4C4C4).withOpacity(0.7), // Light grey
          const Color(0xFF646464).withOpacity(0.7), // Dark grey
          const Color(0xFF444444).withOpacity(0.7), // Even darker grey
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    );
  }
}
