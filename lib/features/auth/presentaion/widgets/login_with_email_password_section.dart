import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';

class LoginWithEmailPasswordSection extends StatelessWidget {
  const LoginWithEmailPasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Your Email',
        ),
        const SizedBox(height: 33,),
        const CustomTextFormField(
          hintText: 'Password',
        ),
        const SizedBox(height: 28,),
        CustomButton(
          text: 'Login',
          textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
          buttonColor: AppColors.kPrimaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
