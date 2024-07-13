import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/i_auth_repository.dart';

import '../states/auth_state.dart';

class AuthCubit extends Cubit<IAuthState> {
  AuthCubit({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(IdleAuthState());

  final IAuthRepository _authRepository;

  void registerUser(String username, String password) async {
    emit(LoadingAuthState());
    final result = await _authRepository.registerUser(username, password);
    if (result.isSuccess) {
      emit(SuccessAuthListener(message: result.message));
    } else {
      emit(FailureAuthListener(message: result.message));
    }
    emit(IdleAuthState());
  }
}
