import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';
import 'package:pinput/pinput.dart';
class OTPScreenBody extends StatelessWidget {
  const OTPScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding32),
          child: Text(
            'We have sent an OTP to your Mobile',
            style: FontsStyles.regular30,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding32),
          child: Text(
            'Please check your mobile number 071*****12 continue to reset your password',
            style: FontsStyles.regular14,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Pinput(
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          length: 4,
          closeKeyboardWhenCompleted: true,
        ),
        const SizedBox(
          height: 28,
        ),
        CustomButton(
            onPressed: () {},
            text: 'Next',
            textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
            buttonColor: AppColors.kPrimaryColor,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Don\'t retrive?',style: FontsStyles.regular14,),
          CustomTextButton(onPressed: () {
            
          },text:'Click here', textStyle: FontsStyles.bold14.copyWith(color: AppColors.kPrimaryColor))
        ],),
      ],
    );
  }
}
