import 'package:flutter/material.dart';
import 'package:meal_monkey/core/widgets/custom_text_form_field.dart';
import 'package:meal_monkey/features/auth/view_model/sign_up_view_model.dart';

class EnterSignUpData extends StatelessWidget {
  const EnterSignUpData({
    super.key,
    required SignUpViewModel viewModel,
    required this.isLoading,
  }) : _viewModel = viewModel;

  final SignUpViewModel _viewModel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _viewModel.nameController,
          hintText: 'Name',
          enabled: !isLoading,
          keyboardType: TextInputType.name,
          validator:  _viewModel.validateName ,
        ),
        const SizedBox(
          height: 28,
        ),
        CustomTextFormField(
          controller: _viewModel.emailController,
          hintText: 'Email',
          enabled: !isLoading,
          keyboardType: TextInputType.emailAddress,
          validator: _viewModel.validateEmail,
        ),
        const SizedBox(
          height: 28,
        ),
        CustomTextFormField(
          controller: _viewModel.mobileController,
          keyboardType: TextInputType.phone,
          hintText: 'Mobile No',
          enabled: !isLoading,
          validator: _viewModel.validateMobile,
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
          controller: _viewModel.passwordController,
          hintText: 'Password',
          enabled: !isLoading,
          obscureText: true,
          validator: _viewModel.validatePassword,
        ),
        const SizedBox(
          height: 28,
        ),
        CustomTextFormField(
          controller: _viewModel.confirmPasswordController,
          hintText: 'Confirm Password',
          enabled: !isLoading,
          obscureText: true,
          validator: _viewModel.validateConfirmPassword,
        ),
      ],
    );
  }
}
