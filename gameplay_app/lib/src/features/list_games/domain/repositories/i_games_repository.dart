import '../results/get_games_result.dart';

abstract class IGamesRepository {
  Future<GetGamesResult> getGames();
}
