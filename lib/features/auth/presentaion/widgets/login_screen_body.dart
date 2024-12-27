
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/login_cubit/login_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_screen_component.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_email_password_section.dart';
import 'package:meal_monkey/features/auth/presentaion/widgets/login_with_social_media_section.dart';
import 'package:meal_monkey/features/auth/view_model/login-view-model.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  // final _formKey = GlobalKey<FormState>();
  //
  // final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  //
  // final _emailController = TextEditingController();
  //
  // final _passwordController = TextEditingController();
  //
  // void _submitForm(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     final body = {
  //       'email': _emailController.text.trim(),
  //       'password': _passwordController.text.trim(),
  //     };
  //
  //     BlocProvider.of<LoginCubit>(context).loginUser(body: body);
  //   }
  // }
  late final LoginViewModel _viewModel;

  @override
  void initState() {
    _viewModel = LoginViewModel();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          _viewModel.handleLoginSuccess(context, state.user);
        } else if (state is LoginFailure) {
          _viewModel.handleLoginError(context, state.errMsg);
        }
      },
      builder: (context, state) {
        // final isLoading = state is AuthLoading;
        final isLoading = state is LoginLoading;
        return _buildLoginForm(context, isLoading);
        // return Form(
        //   // autovalidateMode: autovalidateMode,
        //   key: _formKey,
        //   child: SafeArea(
        //     child: Column(
        //       children: [
        //         const Text(
        //           'Login',
        //           style: FontsStyles.regular30,
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         Text(
        //           'Add your details to login',
        //           style: FontsStyles.regular14
        //               .copyWith(color: AppColors.kBlackIconColor),
        //         ),
        //         const SizedBox(
        //           height: 32,
        //         ),
        //         LoginWithEmailPasswordSection(
        //           emailController: _emailController,
        //           passwordController: _passwordController,
        //           onPressed: () => _submitForm(context),
        //           isLoading: isLoading,
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         CustomTextButton(
        //             text: "Forgot your password?",
        //             textStyle: FontsStyles.regular14
        //                 .copyWith(color: AppColors.kBlackIconColor),
        //             onPressed: () {} // Disable when loading
        //             ),
        //         const Spacer(),
        //         const LoginWithSocialMediaSection(),
        //         const Spacer(),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Text('Don\'t have an Account?'),
        //             CustomTextButton(
        //                 text: 'Sign Up',
        //                 textStyle: FontsStyles.bold14
        //                     .copyWith(color: AppColors.kPrimaryColor),
        //                 onPressed: () {
        //                   if (Navigator.canPop(context)) {
        //                     context.pop();
        //                   } else {
        //                     context.push(AppRouter.kSignUpScreen);
        //                   }
        //                 }),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

  Widget _buildLoginForm(BuildContext context, bool isLoading) {
    return Form(
      key: _viewModel.formKey,
      child: SafeArea(
        child: Column(
          children: [
            const LoginHeader(),
            const SizedBox(height: 32),
            LoginWithEmailPasswordSection(
              emailController: _viewModel.emailController,
              passwordController: _viewModel.passwordController,
              onPressed: () => _viewModel.handleEmailPasswordLogin(context),
              isLoading: isLoading,
              validateEmail: _viewModel.validateEmail,
              validatePassword: _viewModel.validatePassword,
            ),
            const SizedBox(height: 15),
            ForgotPasswordButton(
              onPressed: isLoading ? null : () => _viewModel.handleForgotPassword(context),
            ),
            const Spacer(),
            const LoginWithSocialMediaSection(
              // onGooglePressed: isLoading ? null : () => _viewModel.handleGoogleLogin(context),
              // onFacebookPressed: isLoading ? null : () => _viewModel.handleFacebookLogin(context),
            ),
            const Spacer(),
            SignUpPrompt(
              onPressed: isLoading ? null : () => _viewModel.handleSignUpNavigation(context),
            ),
          ],
        ),
      ),
    );
  }
}
