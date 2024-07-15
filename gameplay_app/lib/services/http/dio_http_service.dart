import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gameplay_app/services/http/http_response.dart';

import 'i_http_service.dart';

class DioHttpService implements IHttpService {
  final _dio = Dio();

  @override
  Future<HttpResponse<T>?> delete<T>(String url, data,
      {Map<String, dynamic>? queryParameters}) async {
    return _executeRequest(
      () => _dio.delete(url, data: data, queryParameters: queryParameters),
    );
  }

  @override
  Future<HttpResponse<T>?> get<T>(String url,
      {Map<String, dynamic>? queryParameters, Duration? timeOut}) {
    return _executeRequest(
      () => _dio.get(url, queryParameters: queryParameters),
    );
  }

  @override
  Future<HttpResponse<T>?> patch<T>(String url, data,
      {Map<String, dynamic>? queryParameters, bool retry = true}) async {
    return _executeRequest(
        () => _dio.patch(url, data: data, queryParameters: queryParameters));
  }

  @override
  Future<HttpResponse<T>?> post<T>(
    String url,
    data, {
    Map<String, dynamic>? queryParameters,
    Duration? timeOut,
  }) async {
    return _executeRequest(
        () => _dio.post(url, data: data, queryParameters: queryParameters),
        timeOut: timeOut);
  }

  @override
  Future<HttpResponse<T>?> put<T>(String url, data,
      {Map<String, dynamic>? queryParameters, bool retry = true}) async {
    return _executeRequest(
        () => _dio.put(url, data: data, queryParameters: queryParameters));
  }

  HttpResponse<T> _dioResponseConverter<T>(Response? response) {
    if (response != null) {
      _showLogOfResponse(response);
    }
    return HttpResponse<T>(
      statusCode: response?.statusCode,
      data: response?.data,
      headers: response?.headers.map,
    );
  }

  Future<HttpResponse<T>?> _executeRequest<T>(
    Future<Response> Function() executionFunction, {
    Duration? timeOut,
  }) async {
    try {
      var response = await executionFunction();

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      switch (e.error) {
        case SocketException():
        //throw InternetException(message: e.message);
        // case AuthenticationException():
        //   throw AuthenticationException();
        default:
      }
      return null;
    }
  }

  void _showLogOfResponse(Response response) {
    log(
      "[StatusCode: ${response.statusCode}] :: [Endpoint: ${response.realUri}] :: [Method: ${response.requestOptions.method.toUpperCase()}] :: [Header: ${response.requestOptions.headers}] :: [Body Response: ${response.data}]",
    );
  }
}
