import 'package:dio/dio.dart';

import '../security/auth_interceptor.dart';

class DioClient {
  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  static Dio getInstance() {
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }
}