import '../../../create_game_room/domain/results/create_game_room_result.dart';
import '../results/get_home_game_rooms_result.dart';

abstract class IGameRoomRepository {
  Future<GetHomeGameRoomsResult> getAll();
  Future<CreateGameRoomResult> createGameRoom(
    String date,
    String time,
    String description,
    int idGame,
    int idCategory,
    int idUserOwner,
  );
}
