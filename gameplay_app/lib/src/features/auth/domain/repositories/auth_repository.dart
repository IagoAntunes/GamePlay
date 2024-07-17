import 'package:gameplay_app/src/features/auth/datasource/datasource/i_auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:gameplay_app/src/features/auth/domain/requests/login_user_request.dart';
import 'package:gameplay_app/src/features/auth/domain/requests/register_user_request.dart';

import '../result/create_user_result.dart';
import '../result/login_user_result.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository({required IAuthDataSource dataSource})
      : _dataSource = dataSource;
  final IAuthDataSource _dataSource;

  @override
  Future<CreateUserResult> registerUser(
      String username, String password) async {
    var request = RegisterUserRequest(username: username, password: password);

    final result = await _dataSource.registerUser(request);

    if (result.isSuccess) {
      return CreateUserResult(
        isSuccess: result.isSuccess,
        message: result.message,
      );
    } else {
      return CreateUserResult(
        isSuccess: result.isSuccess,
        message: result.message,
      );
    }
  }

  @override
  Future<LoginUserResult> login(String username, String password) async {
    var request = LoginUserRequest(username: username, password: password);
    var result = await _dataSource.login(request);
    if (result.isSuccess) {
      return LoginUserResult(
        isSuccess: result.isSuccess,
        message: result.message,
        token: result.result!['token'],
        username: result.result!['username'],
        id: result.result!['id'],
      );
    } else {
      return LoginUserResult(
        isSuccess: result.isSuccess,
        message: result.message,
        token: '',
        username: '',
        id: 0,
      );
    }
  }
}
