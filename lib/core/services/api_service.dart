import 'package:dio/dio.dart';
import 'package:meal_monkey/core/utils/constatns.dart';
import 'package:meal_monkey/core/utils/secure_local_network.dart';

class ApiService {
  final String _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;

  ApiService(this._dio);


  Future<Map<String, dynamic>> get({required String endPoint}) async {
  String? token =await SecureLocalStorage.getToken(key: AppConstants.tokenKey);
    var response = await _dio.get(
      "$_baseUrl$endPoint",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          'Authorization': token ,
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
  String? token =await SecureLocalStorage.getToken(key: AppConstants.tokenKey);
    var response = await _dio.post(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          'Authorization': token ,
        },
      ),
    );
    return response.data;
  }
}
