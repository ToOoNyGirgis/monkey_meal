import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/navigation/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an Account?'),
        CustomTextButton(
          text: 'Login',
          textStyle: FontsStyles.bold14
              .copyWith(color: AppColors.kPrimaryColor),
          onPressed: isLoading
              ? null
              : () {
            if (Navigator.canPop(context)) {
              context.pop();
            } else {
              context.push(AppRouter.kLoginScreen);
            }
          },
        ),
      ],
    );
  }
}


class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Sign Up',
          style: FontsStyles.regular30,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Add your details to sign up',
          style: FontsStyles.regular14
              .copyWith(color: AppColors.kBlackIconColor),
        ),
      ],
    );
  }
}
