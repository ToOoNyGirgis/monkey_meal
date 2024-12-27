import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';

class LoginWithEmailPasswordSection extends StatelessWidget {
  const LoginWithEmailPasswordSection({
    super.key, required this.emailController, required this.passwordController, required this.onPressed, required this.isLoading, this.validateEmail, this.validatePassword,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final bool isLoading;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validatePassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomTextFormField(
          controller: emailController,
          hintText: 'Your Email',
           keyboardType: TextInputType.emailAddress,
           validator: validateEmail,
        ),
        const SizedBox(height: 33,),
         CustomTextFormField(
           controller: passwordController,
          hintText: 'Password',
           obscureText: true,
           validator: validatePassword,
        ),
        const SizedBox(height: 28,),
        CustomButton(
          text: isLoading ? 'Loading...' : 'Login',
          textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
          buttonColor: AppColors.kPrimaryColor,
          onPressed: isLoading ? null : onPressed,
        ),
      ],
    );
  }
}
