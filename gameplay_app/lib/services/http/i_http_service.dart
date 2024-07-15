import 'http_response.dart';

abstract class IHttpService {
  Future<HttpResponse<T>?> get<T>(String url,
      {Map<String, dynamic>? queryParameters, Duration? timeOut});

  Future<HttpResponse<T>?> post<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Duration? timeOut,
  });

  Future<HttpResponse<T>?> put<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse<T>?> patch<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse<T>?> delete<T>(
    String url,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
  });
}
