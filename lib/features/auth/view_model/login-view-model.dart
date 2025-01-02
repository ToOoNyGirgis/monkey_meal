import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/features/auth/data/models/user_data/user_model.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/login_cubit/login_cubit.dart';

class LoginViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  // Validation logic
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Login methods
  void handleEmailPasswordLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    }
  }

  void handleGoogleLogin(BuildContext context) {
    context.read<LoginCubit>().loginWithGoogle();
  }

  void handleFacebookLogin(BuildContext context) {
    context.read<LoginCubit>().loginWithFacebook();
  }

  // Navigation
  void handleSignUpNavigation(BuildContext context) {
    if (Navigator.canPop(context)) {
      context.pop();
    } else {
      context.push(AppRouter.kSignUpScreen);
    }
  }

  void handleForgotPassword(BuildContext context) {
    context.push(AppRouter.kResetPasswordScreen);
  }

  void handleLoginSuccess(BuildContext context, UserModel user) {
    if (user.data != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );
      context.pushReplacement(AppRouter.kHomeScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${user.message}')),
      );
    }
  }

  void handleLoginError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}
