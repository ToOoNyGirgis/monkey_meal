import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      "$_baseUrl$endPoint",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // Optional: Ensure the server expects JSON
          'lang': 'en',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post(
      "$_baseUrl$endPoint",
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // Optional: Ensure the server expects JSON
          'lang': 'en',
        },
      ),
    );
    return response.data;
  }
}
