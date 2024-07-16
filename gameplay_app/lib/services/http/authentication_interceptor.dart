import 'package:dio/dio.dart';
import 'package:gameplay_app/core/url/app_keys_keyvalue_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({required ISecureStorage secureStorage})
      : _secureStorage = secureStorage;
  final ISecureStorage _secureStorage;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await _secureStorage.get<String>(AppKeysKeyValueStorage.token);
    if (!options.headers.containsKey('Authorization')) {
      options.headers.addAll({"Authorization": "Bearer $token"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    if (response.data is Map<String, dynamic>) {
      if ((response.data as Map<String, dynamic>).containsKey('Message')) {
        if (response.data['Message'] ==
            "Authorization has been denied for this request.") {
          //
        }
      }
    }
  }
}
