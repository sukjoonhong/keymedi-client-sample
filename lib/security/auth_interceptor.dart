
import 'package:dio/dio.dart';
import '../config/api_endpoints.dart';
import '../constants/http_status_codes.dart';
import '../logger.dart';
import 'auth_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AuthStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-Type'] = 'application/json';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    if (statusCode == HttpStatusCodes.unauthorized || statusCode == HttpStatusCodes.forbidden) {
      bool success = await refreshAccessToken();
      if (success) {
        return handler.resolve(await _retryRequest(err.requestOptions));
      }
    }
    return handler.next(err);
  }

  Future<bool> refreshAccessToken() async {
    String? refreshToken = await AuthStorage.getRefreshToken();
    if (refreshToken == null) return false;

    try {
      final dio = Dio(BaseOptions(validateStatus: (status) => status! < 500));
      Response response = await dio.get(
        ApiEndpoints.auth.refresh,
        queryParameters: {"refreshToken": refreshToken},
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        await AuthStorage.saveAccessToken(response.data);
        return true;
      }
    } catch (e) {
      logger.e("Auth", "Refresh Token 만료됨: 다시 로그인 필요!");
    }
    return false;
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();

    final updatedHeaders = Map<String, dynamic>.from(requestOptions.headers);
    updatedHeaders['Authorization'] = 'Bearer ${await AuthStorage.getAccessToken()}';

    return dio.request(
      requestOptions.path,
      options: Options(
        method: requestOptions.method,
        headers: updatedHeaders,
        responseType: requestOptions.responseType,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        validateStatus: requestOptions.validateStatus,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}