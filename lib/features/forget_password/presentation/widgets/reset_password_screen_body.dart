import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';
import 'package:meal_monkey/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:meal_monkey/features/forget_password/presentation/widgets/reset_password_heading.dart';

class ResetPasswordScreenBody extends StatelessWidget {
   ResetPasswordScreenBody({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ResetPasswordHeading(),
        const SizedBox(
          height: 40,
        ),
         CustomTextFormField(
          hintText: 'Email',
          controller: controller ,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 28,
        ),
        CustomButton(
            onPressed: () {
              BlocProvider.of<ForgetPasswordCubit>(context)
                  .verifyEmail(controller.text);
            },
            text: 'Send',
            textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
            buttonColor: AppColors.kPrimaryColor)
      ],
    );
  }
}
