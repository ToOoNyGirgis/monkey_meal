import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/constatns.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color buttonColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final Icon? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.buttonColor,
     this.onPressed,
    this.icon,  this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding32),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor??Colors.transparent),
              borderRadius: BorderRadius.circular(32.0), // Rounded corners
            ),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center icon and text
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 30.0),
              ],
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
