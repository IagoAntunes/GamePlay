import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';
import 'package:gameplay_app/src/features/list_games/datasource/datasource/i_games_datasource.dart';
import 'package:gameplay_app/src/features/list_games/domain/repositories/i_games_repository.dart';
import 'package:gameplay_app/src/features/list_games/domain/results/get_games_result.dart';

class GamesRepository implements IGamesRepository {
  GamesRepository({required IGamesDataSource gamesDataSource})
      : _gamesDataSource = gamesDataSource;
  final IGamesDataSource _gamesDataSource;

  @override
  Future<GetGamesResult> getGames() async {
    final result = await _gamesDataSource.getGames();

    List<GameModel> games = [];

    for (var item in result.result!['list']) {
      games.add(GameModel.fromMap(item));
    }

    return GetGamesResult(
      games: games,
      isSuccess: result.isSuccess,
      message: result.message,
    );
  }
}
