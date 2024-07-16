import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/i_auth_repository.dart';

import '../states/auth_state.dart';

class AuthCubit extends Cubit<IAuthState> {
  AuthCubit(
      {required IAuthRepository authRepository,
      required ControlAuthCubit controlAuthCubit})
      : _authRepository = authRepository,
        _controlAuthCubit = controlAuthCubit,
        super(IdleAuthState());

  final ControlAuthCubit _controlAuthCubit;
  final IAuthRepository _authRepository;

  void registerUser(String username, String password) async {
    emit(LoadingAuthState());
    final result = await _authRepository.registerUser(username, password);
    if (result.isSuccess) {
      emit(SuccessRegisterListener(message: result.message));
    } else {
      emit(FailureRegisterListener(message: result.message));
    }
    emit(IdleAuthState());
  }

  void login({required String username, required String password}) async {
    emit(LoadingAuthState());
    final result = await _authRepository.login(username, password);
    if (result.isSuccess) {
      _controlAuthCubit.login(result.token, result.username);
      emit(SuccessLoginListener(message: result.message));
    } else {
      emit(FailureLoginListener(message: result.message));
    }
    emit(IdleAuthState());
  }
}
