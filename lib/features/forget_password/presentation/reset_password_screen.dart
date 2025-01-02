import 'package:flutter/material.dart';
import 'package:meal_monkey/features/forget_password/presentation/widgets/reset_password_screen_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ResetPasswordScreenBody()),
    );
  }
}
