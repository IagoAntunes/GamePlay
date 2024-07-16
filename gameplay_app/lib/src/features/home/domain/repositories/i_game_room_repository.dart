import '../results/get_home_game_rooms_result.dart';

abstract class IGameRoomRepository {
  Future<GetHomeGameRoomsResult> getAll();
}
