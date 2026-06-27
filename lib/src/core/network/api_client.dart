import 'dart:async';

import 'package:dio/dio.dart';

import 'package:aura_app/src/core/repository/auth_repository.dart';

abstract final class ApiEndpoints {
  static const String registerUser = '/users/register';
  static const String loginUser = '/users/login';
  static const String oauthLogin = '/users/oauth';
  static const String depositFunds = '/users/deposit';

  static const String stocks = '/market/stocks';
  static String stockById(int id) => '/market/stocks/$id';

  static const String portfolio = '/portfolio';
  static const String portfolioTrade = '/portfolio/trade';

  static const String automations = '/automations';
  static const String notificationSettings = '/notifications/settings';
}

class ApiClient {
  ApiClient._(this._dio, {String? accessToken, AuthRepository? authRepository})
    : _authRepository = authRepository {
    _accessToken = accessToken;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = _accessToken ?? await _authRepository?.getToken();
          final hasAuthorizationHeader = options.headers.containsKey(
            'Authorization',
          );

          if ((token ?? '').isNotEmpty && !hasAuthorizationHeader) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            clearAccessToken();
            unawaited(_authRepository?.logout());
          }

          handler.next(error);
        },
      ),
    );
  }

  static const String defaultBaseUrl = 'http://10.0.2.2:3000/api';

  final Dio _dio;
  final AuthRepository? _authRepository;
  String? _accessToken;

  factory ApiClient({
    String? baseUrl,
    String? accessToken,
    AuthRepository? authRepository,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? defaultBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return ApiClient._(
      dio,
      accessToken: accessToken,
      authRepository: authRepository,
    );
  }

  Dio get dio => _dio;

  String? get accessToken => _accessToken;

  Future<void> setAccessToken(String? token) async {
    _accessToken = token;
    if (token != null && token.isNotEmpty) {
      await _authRepository?.saveToken(token);
    }
  }

  void clearAccessToken() {
    _accessToken = null;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _request<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _request<T>(
      path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _request<T>(
      path,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _request<T>(
      path,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> _request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          method: method,
          headers: options?.headers,
          contentType: options?.contentType,
          responseType: options?.responseType,
          extra: options?.extra,
          followRedirects: options?.followRedirects,
          receiveTimeout: options?.receiveTimeout,
          sendTimeout: options?.sendTimeout,
          validateStatus: options?.validateStatus,
          receiveDataWhenStatusError: options?.receiveDataWhenStatusError,
          listFormat: options?.listFormat,
        ),
      );
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}

class ApiException implements Exception {
  ApiException(this.message, {this.statusCode, this.data});

  final String message;
  final int? statusCode;
  final dynamic data;

  factory ApiException.fromDioException(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return ApiException('Connection timed out.');
    }

    if (error.type == DioExceptionType.connectionError) {
      return ApiException('Unable to connect to the server.');
    }

    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'];
      if (message is String && message.isNotEmpty) {
        return ApiException(
          message,
          statusCode: statusCode,
          data: responseData,
        );
      }
    }

    if (responseData is String && responseData.isNotEmpty) {
      return ApiException(
        responseData,
        statusCode: statusCode,
        data: responseData,
      );
    }

    return ApiException(
      error.message ?? 'An unexpected error occurred.',
      statusCode: statusCode,
      data: responseData,
    );
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
