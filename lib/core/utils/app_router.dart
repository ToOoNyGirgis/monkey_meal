import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/functions/check_local_data.dart';
import 'package:meal_monkey/core/utils/service_locator.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo_impl.dart';
import 'package:meal_monkey/features/auth/presentaion/auth_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/login_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/login_cubit/login_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/sign_up_sceen.dart';
import 'package:meal_monkey/features/forget_password/data/repos/forget_password_repo_impl.dart';
import 'package:meal_monkey/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:meal_monkey/features/forget_password/presentation/reset_password_screen.dart';
import 'package:meal_monkey/features/home/presentation/main_screen.dart';
import 'package:meal_monkey/features/onBoarding/presentation/manager/on_boarding_cubit.dart';
import 'package:meal_monkey/features/onBoarding/presentation/on_boarding_screen.dart';
import 'package:meal_monkey/features/splash/splash_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: kOnBoardingScreen,
    routes: <RouteBase>[
      // OnBoardingScreen
      GoRoute(
        path: kOnBoardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder(
              future: checkOnBoarding(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen();
                }
                // If there is a token, go to HomeScreen, otherwise go to AuthScreen
                if (snapshot.hasData && snapshot.data == true) {
                  return tokenCheck();
                } else {
                  return BlocProvider(
                    create: (context) => OnboardingCubit(),
                    child: const OnBoardingScreen(),
                  );
                }
              }
          );
        },
      ),
      // AuthScreen
      GoRoute(
        path: kAuthScreen,
        builder: (BuildContext context, GoRouterState state) {
          return tokenCheck();
        },
      ),
      // SignUpScreen
      GoRoute(
        path: kSignUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            child: const SignUpScreen(),
          );
        },
      ),
      // ResetPasswordScreen
      GoRoute(
        path: kResetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
            child: const ResetPasswordScreen(),
          );
        },
      ),
      // LoginScreen
      GoRoute(
        path: kLoginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
            child: const LoginScreen(),
          );
        },
      ),
      // HomeScreen
      GoRoute(
        path: kMainScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
      ),
    ],
  );



  static const String kMainScreen = '/mainScreen';
  static const String kOnBoardingScreen = '/onBoardingScreen';
  static const String kLoginScreen = '/loginScreen';
  static const String kSignUpScreen = '/signUpScreen';
  static const String kAuthScreen = '/AuthScreen';
  static const String kSearchScreen = '/searchScreen';
  static const String kBookDetailsScreen = '/bookDetailsScreen';
  static const String kResetPasswordScreen = '/resetPasswordScreen';

  static FutureBuilder<bool> tokenCheck() {
    return FutureBuilder(
      future: checkToken(),
      builder: (context, snapshot) {
        // While checking the token, you can show a loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Future.delayed(Duration(seconds: 2),() => const SplashScreen(),);
          return const SplashScreen();
        }

        // If there is a token, go to HomeScreen, otherwise go to AuthScreen
        if (snapshot.hasData && snapshot.data == true) {
          return const MainScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
