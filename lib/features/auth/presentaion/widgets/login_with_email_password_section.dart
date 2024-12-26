import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';

class LoginWithEmailPasswordSection extends StatelessWidget {
  const LoginWithEmailPasswordSection({
    super.key, required this.emailController, required this.passwordController, required this.onPressed, required this.isLoading,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomTextFormField(
          controller: emailController,
          hintText: 'Your Email',
           keyboardType: TextInputType.emailAddress,
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Email is required';
             }
             if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
               return 'Enter a valid email';
             }
             return null;
           },
        ),
        const SizedBox(height: 33,),
         CustomTextFormField(
           controller: passwordController,
          hintText: 'Password',
           obscureText: true,
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Password is required';
             }
             if (value.length < 6) {
               return 'Password must be at least 6 characters';
             }
             return null;
           },
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
