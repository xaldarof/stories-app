import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:flutter/foundation.dart';

extension ResponseExt on Response {
  bool get isSuccessful => statusCode == 200;
}

class DioClient {
  final String _baseUrl = "https://quotes.esoteric.uz/";
  late Dio _dio;

  DioClient() {
    _dio = Dio();
    if (kDebugMode) {
      if (_dio.interceptors.isEmpty == true) {
        _dio.interceptors.add(
          DioLoggingInterceptor(
            level: Level.body,
            compact: false,
          ),
        );
        _dio.interceptors.add(AuthInterceptor());
      }
    }
  }

  Future<BaseOptions> _getOptions() async {
    final token =
        (await EncryptedSharedPreferences.getInstance()).getString('token');

    return BaseOptions(
        baseUrl: _baseUrl,
        responseType: ResponseType.plain,
        connectTimeout: 120000,
        headers: {
          "Authorization": "Bearer $token",
        },
        receiveTimeout: 120000,
        validateStatus: (code) {
          if (code! >= 200 && code <= 400) {
            return true;
          } else {
            return false;
          }
        });
  }

  CancelToken cancelToken() {
    return CancelToken();
  }

  Future<Response<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    _dio.options = await _getOptions();
    return _dio.post<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    _dio.options = await _getOptions();
    return _dio.get<T>(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }

  Future<Response<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.patch(path, data: data, queryParameters: queryParameters);
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //logged out
    }
    super.onError(err, handler);
  }
}
