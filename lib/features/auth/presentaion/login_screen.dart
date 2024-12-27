import 'package:flutter/material.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: LoginScreenBody(),
    );
  }
}
