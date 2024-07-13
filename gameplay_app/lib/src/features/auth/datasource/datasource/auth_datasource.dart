import 'package:dio/dio.dart';
import 'package:gameplay_app/core/response/base_api_response.dart';
import 'package:gameplay_app/core/url/app_api_urls.dart';
import 'package:gameplay_app/src/features/auth/datasource/datasource/i_auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/domain/requests/login_user_request.dart';
import 'package:gameplay_app/src/features/auth/domain/requests/register_user_request.dart';

class AuthDataSource extends IAuthDataSource {
  AuthDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<IBaseApiResponse> registerUser(RegisterUserRequest request) async {
    try {
      final result = await _dio.post(
        AppApiUrls.registerUser,
        data: request.toJson(),
      );

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return ResponseApiData.success(
          result.data,
          result.statusCode,
        );
      }

      return ResponseApiData.failure(
        result.data,
        result.statusCode,
      );
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }

  @override
  Future<IBaseApiResponse> login(LoginUserRequest request) async {
    try {
      final result = await _dio.post(
        AppApiUrls.login,
        data: request.toJson(),
      );

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return ResponseApiData.success(
          result.data,
          result.statusCode,
        );
      }

      return ResponseApiData.failure(
        result.data,
        result.statusCode,
      );
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }
}
