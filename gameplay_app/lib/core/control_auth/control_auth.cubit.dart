import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/control_auth/control_auth_state.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';

import '../../services/database/key_value/i_key_value_storage.dart';
import '../url/app_keys_keyvalue_storage.dart';

class ControlAuthCubit extends Cubit<IControlAuthState> {
  final IKeyValueStorage _sharedPreferencesService;
  final ISecureStorage _secureStorage;
  ControlAuthCubit({
    required IKeyValueStorage sharedPreferencesService,
    required ISecureStorage secureStorage,
  })  : _sharedPreferencesService = sharedPreferencesService,
        _secureStorage = secureStorage,
        super(
          ControlAuthState(
            isAuthenticated: false,
          ),
        );

  void logout() async {
    await _secureStorage.set<String>(AppKeysKeyValueStorage.token, '');
    await _sharedPreferencesService.set<String>(
        AppKeysKeyValueStorage.username, '');

    emit(ControlAuthState(isAuthenticated: false));
  }

  void login(String token, String username, int idUser) async {
    await _secureStorage.set<String>(AppKeysKeyValueStorage.token, token);
    await _secureStorage.set<int>(AppKeysKeyValueStorage.idUser, idUser);
    await _sharedPreferencesService.set<String>(
        AppKeysKeyValueStorage.username, username);
    emit(ControlAuthState(isAuthenticated: true));
  }
}
