import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/url/app_keys_keyvalue_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';
import 'package:gameplay_app/src/features/home/domain/models/category_model.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';

import '../states/create_gameroom_state.dart';

class CreateGameRoomCubit extends Cubit<ICreateGameRoomState> {
  CreateGameRoomCubit(
      {required IGameRoomRepository gameRoomRepository,
      required ISecureStorage secureStorage})
      : _gameRoomRepository = gameRoomRepository,
        _secureStorage = secureStorage,
        super(IdleCreateGameRoomState());

  final IGameRoomRepository _gameRoomRepository;
  final ISecureStorage _secureStorage;

  String _dayMonth = '';
  String _time = '';

  GameModel? _gameSelected;
  CategoryModel? _categorySelected;

  GameModel? get gameSelected => _gameSelected;

  String description = '';

  void setDayMonth(String dayMonth) {
    _dayMonth = dayMonth;
  }

  void setTime(String time) {
    _time = time;
  }

  void createGameRoom() async {
    emit(LoadingCreateGameRoomState());
    int? idUser = await _secureStorage.get<int>(AppKeysKeyValueStorage.idUser);
    final result = await _gameRoomRepository.createGameRoom(
      _dayMonth,
      _time,
      description,
      _gameSelected!.id,
      _categorySelected!.id,
      idUser!,
    );
    if (result.isSuccess) {
      emit(SuccessCreateGameRoomListener());
    } else {
      emit(FailureCreateGameRoomListener());
      emit(IdleCreateGameRoomState());
    }
  }

  void setGame(GameModel gameSelected) {
    _gameSelected = gameSelected;
    emit(IdleCreateGameRoomState());
  }

  void setCategory(CategoryModel categorySelected) {
    _categorySelected = categorySelected;
  }
}
