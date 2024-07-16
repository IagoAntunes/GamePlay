import 'package:gameplay_app/src/features/home/domain/models/game_room_model.dart';

abstract class IHomeListGameRoomState {}

class IdleHomeListGameRoomState extends IHomeListGameRoomState {}

class LoadingHomeListGameRoomState extends IHomeListGameRoomState {}

class SuccessHomeListGameRoomState extends IHomeListGameRoomState {
  List<GameRoomModel> gameRooms;
  SuccessHomeListGameRoomState({
    required this.gameRooms,
  });
}

class FailureHomeListGameRoomState extends IHomeListGameRoomState {}
