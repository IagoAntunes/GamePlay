import 'package:gameplay_app/src/features/home/datasource/datasource/i_game_room_datasource.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_room_model.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';

import '../results/get_home_game_rooms_result.dart';

class GameRoomRepository implements IGameRoomRepository {
  GameRoomRepository({required IGameRoomDataSource gameRoomDataSource})
      : _gameRoomDataSource = gameRoomDataSource;
  final IGameRoomDataSource _gameRoomDataSource;

  @override
  Future<GetHomeGameRoomsResult> getAll() async {
    final result = await _gameRoomDataSource.getAll();

    List<GameRoomModel> listGameRooms = [];

    if (result.isSuccess) {
      for (var item in result.result!['result']) {
        listGameRooms.add(GameRoomModel.fromMap(item));
      }
    }

    return GetHomeGameRoomsResult(
      message: result.message,
      isSuccess: result.isSuccess,
      gameRooms: listGameRooms,
    );
  }
}
