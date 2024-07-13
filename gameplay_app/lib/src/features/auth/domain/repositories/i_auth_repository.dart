import '../result/create_user_result.dart';
import '../result/login_user_result.dart';

abstract class IAuthRepository {
  Future<CreateUserResult> registerUser(String username, String password);

  Future<LoginUserResult> login(String username, String password);
}
