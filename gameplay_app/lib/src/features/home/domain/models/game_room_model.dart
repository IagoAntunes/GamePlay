import 'package:gameplay_app/src/features/home/domain/models/category_model.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';
import 'package:gameplay_app/src/features/home/domain/models/user_model.dart';

import 'game_room_players_model.dart';

class GameRoomModel {
  String id;
  String date;
  String description;
  String idGame;
  CategoryModel category;
  UserModel userOwner;
  GameModel game;
  List<GameRoomPlayersModel> listPlayers;

  GameRoomModel({
    required this.id,
    required this.date,
    required this.description,
    required this.idGame,
    required this.category,
    required this.userOwner,
    required this.game,
    required this.listPlayers,
  });

  factory GameRoomModel.fromMap(Map<String, dynamic> map) {
    return GameRoomModel(
      id: map['id'].toString(),
      date: map['date'],
      description: map['description'],
      idGame: map['idGame'].toString(),
      category: CategoryModel.fromMap(map['category']),
      userOwner: UserModel.fromMap(map['userOwner']),
      game: GameModel.fromMap(map['game']),
      listPlayers: List<GameRoomPlayersModel>.from(
          map['listPlayers']?.map((x) => GameRoomPlayersModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'idGame': idGame,
      'category': category.toMap(),
      'userOwner': userOwner.toMap(),
      'game': game.toMap(),
      'listPlayers': listPlayers.map((x) => x.toMap()).toList(),
    };
  }
}
