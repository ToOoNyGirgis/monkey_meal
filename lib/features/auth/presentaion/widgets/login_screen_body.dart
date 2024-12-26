import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_email_password_section.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_social_media_section.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final body = {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      };

      BlocProvider.of<AuthCubit>(context).loginUser(body: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          if(state.user.data!=null){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful!')),
            );
            context.pushReplacement(AppRouter.kHomeScreen);}
          else{
            log(state.user.message.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.user.message}')),
            );
          }
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMsg)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: SafeArea(
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
                 LoginWithEmailPasswordSection(
                  emailController: _emailController,
                  passwordController: _passwordController,
                   onPressed: () => _submitForm(context), isLoading: isLoading,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextButton(
                  text: "Forgot your password?",
                  textStyle: FontsStyles.regular14
                      .copyWith(color: AppColors.kBlackIconColor),
                  onPressed: (){} // Disable when loading
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
          ),
        );
      },
    );
  }
}
