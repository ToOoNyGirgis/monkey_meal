import 'package:flutter/cupertino.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/font_styles.dart';
import 'package:meal_monkey/core/utils/functions/shared_preferance.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'delete token',
          textStyle: FontsStyles.bold18,
          buttonColor: CupertinoColors.white,
          onPressed: () {
            SecureLocalStorage.deleteToken(key: AppConstants.tokenKey);
            SharedPreferencesMethods.clear();

          },
        ),
      ],
    );
  }
}
