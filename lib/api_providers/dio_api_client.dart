import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/local_storage_service.dart';
import 'dio_interceptor.dart';

const _defaultConnectTimeout = Duration(milliseconds: 1000, seconds: 60);
const _defaultReceiveTimeout = Duration(milliseconds: 1000, seconds: 60);

class DioClient {
  String? baseUrl;
  static Dio? _dio;
  bool enableLogger = true;

  DioClient(this.baseUrl, Dio dio) {
    _dio = Dio();
    _dio!
      ..options.baseUrl = baseUrl!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

    if (enableLogger) {
      _dio!.interceptors.addAll({
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
        DioInterceptor(),
      });
    }
  }

  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      data,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth = false}) async {
    try {
      if (skipAuth == false) {
        await AppPreference.getUserToken().then((token) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        });
      }
      var response = await _dio?.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    }
  }

  Future<dynamic> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth = false}) async {
    try {
      if (skipAuth == false) {
        await AppPreference.getUserToken().then((token) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        });
      }
      var response = await _dio?.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    }
  }

  Future<dynamic> put(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth = false}) async {
    try {
      if (skipAuth == false) {
        await AppPreference.getUserToken().then((token) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        });
      }
      var response = await _dio?.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    }
  }

  Future<dynamic> delete(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth = false}) async {
    try {
      if (skipAuth == false) {
        await AppPreference.getUserToken().then((token) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        });
      }
      var response = await _dio?.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    }
  }
}
