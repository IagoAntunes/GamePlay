class HttpResponse<T> {
  final int? statusCode;
  final T? data;
  final Map<String, dynamic>? headers;

  HttpResponse({
    required this.statusCode,
    required this.data,
    required this.headers,
  });
}
