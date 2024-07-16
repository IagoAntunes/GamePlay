import 'package:gameplay_app/src/features/home/domain/models/game_room_model.dart';

class GetHomeGameRoomsResult {
  String message;
  bool isSuccess;
  final List<GameRoomModel> gameRooms;

  GetHomeGameRoomsResult({
    required this.message,
    required this.isSuccess,
    required this.gameRooms,
  });
}
