// login_header.dart
import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Login',
          style: FontsStyles.regular30,
        ),
        const SizedBox(height: 15),
        Text(
          'Add your details to login',
          style: FontsStyles.regular14.copyWith(
            color: AppColors.kBlackIconColor,
          ),
        ),
      ],
    );
  }
}

// forgot_password_button.dart
class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ForgotPasswordButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: "Forgot your password?",
      textStyle: FontsStyles.regular14.copyWith(
        color: AppColors.kBlackIconColor,
      ),
      onPressed: onPressed,
    );
  }
}

// sign_up_prompt.dart
class SignUpPrompt extends StatelessWidget {
  final VoidCallback? onPressed;

  const SignUpPrompt({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an Account?'),
        CustomTextButton(
          text: 'Sign Up',
          textStyle: FontsStyles.bold14.copyWith(
            color: AppColors.kPrimaryColor,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}