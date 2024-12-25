import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/auth_create_acc_section.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/logo_section.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LogoSection(),
        // const SizedBox(height: 150),
        Spacer(flex: 3,),
        Text('Discover the best foods from over 1,000 ',style: FontsStyles.regular13,),
        Text('restaurants and fast delivery to your doorstep ',style: FontsStyles.regular13,),
        Spacer(),
        AuthCreateAccSection(),
        Spacer(),
      ],
    );
  }
}


