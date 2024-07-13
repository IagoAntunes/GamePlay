import 'package:gameplay_app/src/features/auth/domain/requests/register_user_request.dart';

import '../../../../../core/response/base_api_response.dart';

abstract class IAuthDataSource {
  Future<IBaseApiResponse> registerUser(RegisterUserRequest request);
}
