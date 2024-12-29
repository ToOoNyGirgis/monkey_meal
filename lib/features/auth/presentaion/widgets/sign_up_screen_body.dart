import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/enter_sign_up_data.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/sign_up_component.dart';
import 'package:meal_monkey/features/auth/view_model/sign_up_view_model.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  late final SignUpViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SignUpViewModel();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          _viewModel.handleSignUpSuccess(context, state.user);
        } else if (state is AuthFailure) {
          _viewModel.handleSignUpError(context, state.errMsg);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return _buildSignUpForm(isLoading, context);
      },
    );
  }

  Form _buildSignUpForm(bool isLoading, BuildContext context) {
    return Form(
        key: _viewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpHeader(),
              const SizedBox(
                height: 37,
              ),
              EnterSignUpData(viewModel: _viewModel, isLoading: isLoading),
              const SizedBox(
                height: 28,
              ),
              CustomButton(
                text: isLoading ? 'Loading...' : 'Sign Up',
                textStyle:
                    FontsStyles.regular16.copyWith(color: Colors.white),
                buttonColor: AppColors.kPrimaryColor,
                onPressed: isLoading ? null : () => _viewModel.handleSignUpWithEmailPassword(context),
              ),
              AlreadyHaveAccount(isLoading: isLoading),
            ],
          ),
        ),
      );
  }
}

