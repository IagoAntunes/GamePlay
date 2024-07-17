import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';

class GetGamesResult {
  String message;
  bool isSuccess;
  List<GameModel> games;
  GetGamesResult({
    required this.message,
    required this.isSuccess,
    required this.games,
  });
}
