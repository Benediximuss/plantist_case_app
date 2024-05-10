import 'package:flutter/material.dart';

class ColorManager {
  const ColorManager._();

  static const Color black = Color.fromRGBO(17, 26, 24, 1.0);
  static const Color indigo = Color.fromRGBO(13, 22, 40, 1.0);
  static const Color gray = Color.fromRGBO(136, 140, 139, 1.0);

  static Color getPriorityColor(int priority) {
    late final Color ret;
    switch (priority) {
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
        break;
    }
    return ret;
  }
}
