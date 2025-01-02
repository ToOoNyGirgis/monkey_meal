import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/functions/shared_preferance.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';

Future<bool> checkToken() async {
  // get token value from local storage
  String? token = await SecureLocalStorage.getToken(key: AppConstants.tokenKey);
  return token != null && token != '';
}

Future<bool> checkOnBoarding() async {
  // get onBoarding value from local storage
  bool? onBoarding =
      await SharedPreferencesMethods.getBool(key: AppConstants.onBoardingKey);
  // if onBoarding is null or false, return false
  if (onBoarding == null || onBoarding == false) {
    return false;
  }
  else {
    return true;
  }

}
