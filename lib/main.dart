import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_monkey/core/utils/app_router.dart';
import 'package:meal_monkey/core/utils/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Meal Monkey',
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(
        textTheme:
        GoogleFonts.interTextTheme(),
      ),
    );
  }
}

