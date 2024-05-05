import 'package:flutter/material.dart';
import 'package:plantist_case_app/widgets/custom_icon_button.dart';

class DynamicButton extends StatelessWidget {
  const DynamicButton({
    super.key,
    required this.text,
    this.icon,
    required this.enabled,
    required this.onPressed,
  });

  final String text;
  final IconData? icon;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      text: text,
      icon: icon,
      onPressed: enabled ? onPressed : null,
    );
  }
}
