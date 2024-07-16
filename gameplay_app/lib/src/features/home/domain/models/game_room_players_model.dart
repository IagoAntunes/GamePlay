import 'package:gameplay_app/src/features/home/domain/models/user_model.dart';

class GameRoomPlayersModel {
  String id;
  UserModel user;

  GameRoomPlayersModel({
    required this.id,
    required this.user,
  });

  factory GameRoomPlayersModel.fromMap(Map<String, dynamic> map) {
    return GameRoomPlayersModel(
      id: map['id'].toString(),
      user: UserModel.fromMap(map['user']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user.toMap(),
    };
  }
}
