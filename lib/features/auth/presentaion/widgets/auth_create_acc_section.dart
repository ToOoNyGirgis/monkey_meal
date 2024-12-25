import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class AuthCreateAccSection extends StatelessWidget {
  const AuthCreateAccSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Login',
          textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
          buttonColor: AppColors.kPrimaryColor,
          onPressed: () {
            context.pushReplacement(AppRouter.kLoginScreen);
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Create an Account',
          textStyle:
              FontsStyles.regular16.copyWith(color: AppColors.kPrimaryColor),
          buttonColor: Colors.white,
          borderColor: AppColors.kPrimaryColor,
          onPressed: () {
            context.pushReplacement(AppRouter.kSignUpScreen);
          },
        ),
      ],
    );
  }
}
