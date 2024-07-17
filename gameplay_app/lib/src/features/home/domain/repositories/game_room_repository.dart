import 'package:flutter/material.dart';
import 'package:gameplay_app/src/features/create_game_room/domain/requests/create_game_room_request.dart';
import 'package:gameplay_app/src/features/home/datasource/datasource/i_game_room_datasource.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_room_model.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';

import '../../../create_game_room/domain/results/create_game_room_result.dart';
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

  @override
  Future<CreateGameRoomResult> createGameRoom(String date, String time,
      String description, int idGame, int idCategory, int idUserOwner) async {
    DateTime auxDate = DateTime.parse(date);
    List<String> timeParts = time.split(":");
    TimeOfDay auxTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(
        timeParts[1],
      ),
    );

    DateTime combinedDateTime = DateTime(
      auxDate.year,
      auxDate.month,
      auxDate.day,
      auxTime.hour,
      auxTime.minute,
    );

    var request = CreateGameRoomRequest(
      date: combinedDateTime.toString(),
      description: description,
      idCategory: idCategory,
      idGame: idGame,
      idUserOwner: idUserOwner,
    );

    final result = await _gameRoomDataSource.createGameRoom(request);
    return CreateGameRoomResult(
      message: result.message,
      isSuccess: result.isSuccess,
    );
  }
}
