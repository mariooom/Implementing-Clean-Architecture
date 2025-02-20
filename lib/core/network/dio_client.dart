import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = 'https://dummyjson.com';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}