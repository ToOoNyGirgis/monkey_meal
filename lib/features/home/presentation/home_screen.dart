import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/functions/shared_preferance.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {

SecureLocalStorage.deleteToken(key: AppConstants.tokenKey);
SharedPreferencesMethods.clear();
        }, child: Text('cleat data'))
      ],
    );
  }
}
