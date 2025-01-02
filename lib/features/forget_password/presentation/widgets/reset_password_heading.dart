import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';

class ResetPasswordHeading extends StatelessWidget {
  const ResetPasswordHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Reset Password',
          style: FontsStyles.regular30,
        ),
        SizedBox(height: 15,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding32),
          child: Text(
            'Please enter your email to receive a link to reate a new password via email',
            style: FontsStyles.regular14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
