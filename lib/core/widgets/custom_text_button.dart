import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.textStyle,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all( 5.0), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
