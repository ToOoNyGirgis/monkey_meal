import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText, this.controller, this.validator, this.obscureText, this.enabled, this.autovalidateMode,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? enabled;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding32),
      child: SizedBox(
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          controller: controller,
          validator: validator,
          obscureText: obscureText??false,
          enabled: enabled??true,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
            FontsStyles.regular14.copyWith(color: AppColors.kHintTextColor),
            fillColor: AppColors.kTextFieldColor,
            focusColor: AppColors.kTextFieldColor,
            hoverColor: AppColors.kTextFieldColor,
            filled: true,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              // Set the border radius
              borderSide: BorderSide.none, // Removes the border stroke
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              // Set the border radius
              borderSide: BorderSide.none, // Removes the enabled border stroke
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              // Set the border radius
              borderSide: const BorderSide(
                  color: Colors.transparent), // Optional for focused state
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                  color: Colors.red), // Optional for focused state
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 34.0),
          ),
        ),
      ),
    );
  }
}
