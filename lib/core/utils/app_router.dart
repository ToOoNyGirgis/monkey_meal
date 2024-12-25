import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/service_locator.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo_impl.dart';
import 'package:meal_monkey/features/auth/presentaion/auth_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/login_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/sign_up_sceen.dart';
import 'package:meal_monkey/features/home/presentation/home_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            child:  const SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );

  static const String kHomeScreen = '/homeScreen';
  static const String kLoginScreen = '/loginScreen';
  static const String kSignUpScreen = '/signUpScreen';
  static const String kSearchScreen = '/searchScreen';
  static const String kBookDetailsScreen = '/bookDetailsScreen';
}
