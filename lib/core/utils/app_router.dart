import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';
import 'package:meal_monkey/core/utils/service_locator.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo_impl.dart';
import 'package:meal_monkey/features/auth/presentaion/auth_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/login_screen.dart';
import 'package:meal_monkey/features/auth/presentaion/manager/auth_cubit/auth_cubit.dart';
import 'package:meal_monkey/features/auth/presentaion/sign_up_sceen.dart';
import 'package:meal_monkey/features/home/presentation/home_screen.dart';
import 'package:meal_monkey/features/splash/splash_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const AuthScreen();
      //   },
      // ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder(
            future: _checkToken(),
            builder: (context, snapshot) {
              // While checking the token, you can show a loading indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Future.delayed(AppConstants.transitionDuration,() => const SplashScreen(),);
                return const SplashScreen();
              }

              // If there is a token, go to HomeScreen, otherwise go to AuthScreen
              if (snapshot.hasData && snapshot.data == true) {
                return const HomeScreen();
              } else {
                return const AuthScreen();
              }
            },
          );
        },
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            child: const SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            child: const LoginScreen(),
          );
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

  static Future<bool> _checkToken() async {
    String? token = await SecureLocalStorage.getToken(key: AppConstants.tokenKey);
    return token != null && token!='';
  }
}
