import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';

class SignUpScreenBody extends StatelessWidget {
  SignUpScreenBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  // final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final body = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _mobileController.text.trim(),
        // 'address': _addressController.text.trim(),
        'password': _passwordController.text.trim(),
      };

      BlocProvider.of<AuthCubit>(context).registerUser(body: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
         if(state.user.data!=null){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful!')),
          );
          context.pushReplacement(AppRouter.kHomeScreen);}
         else{
           print(state.user.message);
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
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Sign Up',
                  style: FontsStyles.regular30,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Add your details to sign up',
                  style: FontsStyles.regular14
                      .copyWith(color: AppColors.kBlackIconColor),
                ),
                const SizedBox(
                  height: 37,
                ),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: 'Name',
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Email',
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  controller: _mobileController,
                  hintText: 'Mobile No',
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mobile number is required';
                    }
                    if (!RegExp(r'^\d{6,15}$').hasMatch(value)) {
                      return 'Enter a valid mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  // controller: _addressController,
                  hintText: 'Address',
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: 'Password',
                  enabled: !isLoading,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  enabled: !isLoading,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomButton(
                  text: isLoading ? 'Loading...' : 'Sign Up',
                  textStyle: FontsStyles.regular16.copyWith(color: Colors.white),
                  buttonColor: AppColors.kPrimaryColor,
                  onPressed: isLoading ? null : () => _submitForm(context),
                ),
                // const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account?'),
                    CustomTextButton(
                        text: 'Login',
                        textStyle: FontsStyles.bold14
                            .copyWith(color: AppColors.kPrimaryColor),
                      onPressed: isLoading
                          ? null
                          : () {
                        if (Navigator.canPop(context)) {
                          context.pop();
                        } else {
                          context.push(AppRouter.kLoginScreen);
                        }
                      },),
                  ],
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
