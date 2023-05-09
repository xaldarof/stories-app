import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:jokes_app/core/session/manager/session_manager.dart';

extension ResponseExt on Response {
  bool get isSuccessful => statusCode == 200 || statusCode == 201;
}

class DioClient {
  final SessionManager _sessionManager;
  final String _debugUrl = "http://127.0.0.1:8000/";
  final String _prodUrl = "http://xaldarof8.pythonanywhere.com/";
  final bool _isDebug = false;
  late Dio _dio;

  DioClient(this._sessionManager) {
    _dio = Dio();
    if (kDebugMode) {
      if (_dio.interceptors.isEmpty == true) {
        _dio.interceptors.add(
          DioLoggingInterceptor(
            level: Level.body,
            compact: false,
          ),
        );
        _dio.interceptors.add(AuthInterceptor(sessionManager: _sessionManager));
      }
    }
  }

  Future<BaseOptions> _getOptions() async {
    return BaseOptions(
      baseUrl: _isDebug ? _debugUrl : _prodUrl,
      responseType: ResponseType.plain,
      connectTimeout: 120000,
      receiveTimeout: 120000,
      headers: {
        "Authorization": _sessionManager.accessToken,
      },
      validateStatus: (code) {
        if (code! >= 200 && code <= 400) {
          return true;
        } else {
          return false;
        }
      },
    );
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

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio.options = await _getOptions();
    return _dio.put(path, data: data, queryParameters: queryParameters);
  }
}

class AuthInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _sessionManager.endLocalSession();
    }
    super.onError(err, handler);
  }

  AuthInterceptor({
    required SessionManager sessionManager,
  }) : _sessionManager = sessionManager;
}
