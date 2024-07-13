import '../result/create_user_result.dart';

abstract class IAuthRepository {
  Future<CreateUserResult> registerUser(String username, String password);
}
