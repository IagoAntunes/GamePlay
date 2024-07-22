import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/url/app_keys_keyvalue_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';
import 'package:gameplay_app/src/features/game_room_info/presentation/states/game_room_info_stte.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';

class GameRoomInfoCubit extends Cubit {
  GameRoomInfoCubit({
    required IGameRoomRepository gameRoomRepository,
    required ISecureStorage secureStorage,
  })  : _gameRoomRepository = gameRoomRepository,
        _secureStorage = secureStorage,
        super(IdleGameRoomInfoState());

  final IGameRoomRepository _gameRoomRepository;
  final ISecureStorage _secureStorage;

  int? idUser;

  void enterGameRoom(int idGameRoom) async {
    emit(LoadingGameRoomInfoState());

    var result = await _gameRoomRepository.enterGameRoom(idGameRoom, idUser!);
    if (result.isSuccess) {
      emit(SuccessGameRoomInfoListener());
      emit(SuccessGameRoomInfoState());
    } else {
      emit(FailureGameRoomInfoListener());
      emit(IdleGameRoomInfoState());
    }
  }

  Future<String> getIdUser() async {
    idUser = await _secureStorage.get<int>(AppKeysKeyValueStorage.idUser);
    return idUser.toString();
  }
}
