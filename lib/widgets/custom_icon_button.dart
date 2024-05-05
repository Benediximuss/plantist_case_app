import 'package:flutter/material.dart';
import 'package:plantist_case_app/utils/colors.dart';
import 'package:plantist_case_app/utils/text_styles.dart';

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
          // backgroundColor: MaterialStateProperty.all<Color>(
          //   const Color.fromRGBO(245, 245, 245, 1.0),
          // ),
          backgroundColor: MaterialStateProperty.all<Color>(
            lightMode
                ? const Color.fromRGBO(245, 245, 245, 1.0)
                : (onPressed != null
                    ? ColorConsts.indigo
                    : const Color.fromRGBO(182, 185, 190, 1.0)),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: TextStyles.buttonText().fontSize! * 1.25,
                color: lightMode ? ColorConsts.indigo : Colors.white,
              ),
            if (icon != null) const SizedBox(width: 7.5),
            Text(
              text,
              style: TextStyles.buttonText().copyWith(
                color: lightMode ? ColorConsts.indigo : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
