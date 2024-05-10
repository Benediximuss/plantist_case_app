import 'package:flutter/material.dart';
import 'package:plantist_case_app/utils/color_manager.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool lightMode;

  const CustomIconButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.lightMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            lightMode
                ? const Color.fromRGBO(245, 245, 245, 1.0)
                : (onPressed != null ? ColorManager.indigo : const Color.fromRGBO(182, 185, 190, 1.0)),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: Theme.of(context).textTheme.displayMedium!.fontSize! * 1.25,
                color: lightMode ? ColorManager.indigo : Colors.white,
              ),
            if (icon != null) const SizedBox(width: 7.5),
            Text(
              text,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: lightMode ? ColorManager.indigo : Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
