import 'package:flutter/material.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: SignUpScreenBody()),
    );
  }
}
