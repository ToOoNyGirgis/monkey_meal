import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Reset Password',
          style: FontsStyles.regular30,
        ),
        const SizedBox(height: 15,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding32),
          child: Text(
            'Please enter your email to receive a link to reate a new password via email',
            style: FontsStyles.regular14,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40,),
        const CustomTextFormField(hintText: 'Email'),
        const SizedBox(height: 28,),
        CustomButton(
            onPressed: () {

            },
            text: 'Send',
            textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
            buttonColor: AppColors.kPrimaryColor)
      ],
    );
  }
}
