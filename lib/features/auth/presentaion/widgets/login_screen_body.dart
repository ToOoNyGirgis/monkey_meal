import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_email_password_section.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_social_media_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            'Login',
            style: FontsStyles.regular30,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Add your details to login',
            style: FontsStyles.regular14
                .copyWith(color: AppColors.kBlackIconColor),
          ),
          const SizedBox(
            height: 32,
          ),
          const LoginWithEmailPasswordSection(),
          const SizedBox(
            height: 15,
          ),
          CustomTextButton(
            text: "Forgot your password?",
            textStyle: FontsStyles.regular14
                .copyWith(color: AppColors.kBlackIconColor),
            onPressed: () {},
          ),
          const Spacer(),
          const LoginWithSocialMediaSection(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an Account?'),
              CustomTextButton(
                  text: 'Sign Up',
                  textStyle: FontsStyles.bold14
                      .copyWith(color: AppColors.kPrimaryColor),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      context.pop();
                    } else {
                    context.push(AppRouter.kSignUpScreen);
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
