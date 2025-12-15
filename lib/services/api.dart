import 'package:dio/dio.dart';
import 'package:nutri/apikey.dart';

class Api {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Apikey': ApiKey.apiKey,
      },
    ),
  );

  static void setup() {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true, 
      requestBody: true
    ));
  }


  static Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Options? options}) async {
    return await _dio.get(path, queryParameters: queryParameters, options: options);
  }

  static Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  static Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  static Future<Response> patch(String path, {dynamic data}) async {
    return await _dio.patch(path, data: data);
  }

  static Future<Response> delete(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }
}