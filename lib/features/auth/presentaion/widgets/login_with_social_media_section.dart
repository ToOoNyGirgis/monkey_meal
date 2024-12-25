import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class LoginWithSocialMediaSection extends StatelessWidget {
  const LoginWithSocialMediaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or Login With',
          style: FontsStyles.regular14
              .copyWith(color: AppColors.kBlackIconColor),
        ),
        const SizedBox(height: 28,),
        CustomButton(
          text: 'Login with Facebook',
          textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
          buttonColor: AppColors.kFaceBookColor,
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.facebookF,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 28,),
        CustomButton(
          text: 'Login with Google',
          textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
          buttonColor: AppColors.kGoogleColor,
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.googlePlusG,
            size: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
