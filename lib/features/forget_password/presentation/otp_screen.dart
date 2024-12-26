import 'package:flutter/material.dart';
import 'package:meal_monkey/features/forget_password/presentation/widgets/otp_screen_body.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OTPScreenBody()),
    );
  }
}
