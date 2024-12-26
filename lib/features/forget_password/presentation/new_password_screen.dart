import 'package:flutter/material.dart';
import 'package:meal_monkey/features/forget_password/presentation/widgets/new_password_screen_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NewPasswordScreenBody()),
    );
  }
}
