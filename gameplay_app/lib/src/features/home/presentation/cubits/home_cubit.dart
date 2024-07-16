import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/services/database/key_value/i_key_value_storage.dart';
import 'package:gameplay_app/src/features/home/presentation/states/home_state.dart';

import '../../../../../core/url/app_keys_keyvalue_storage.dart';

class HomeCubit extends Cubit<IHomeState> {
  HomeCubit({required IKeyValueStorage keyValueStorage})
      : _keyValueStorage = keyValueStorage,
        super(IdleHomeState());

  final IKeyValueStorage _keyValueStorage;

  String username = '';

  void getUsername() async {
    username =
        await _keyValueStorage.get<String>(AppKeysKeyValueStorage.username) ??
            '';
    emit(IdleHomeState());
  }
}
