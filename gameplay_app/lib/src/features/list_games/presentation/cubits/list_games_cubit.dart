import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/list_games/domain/repositories/i_games_repository.dart';
import 'package:gameplay_app/src/features/list_games/presentation/states/list_games_state.dart';

class GameListCubit extends Cubit<IGameListState> {
  GameListCubit({required IGamesRepository gamesRepository})
      : _gamesRepository = gamesRepository,
        super(IdleGameListState());

  final IGamesRepository _gamesRepository;

  void getGames() async {
    emit(LoadingGameListState());
    final result = await _gamesRepository.getGames();
    if (result.isSuccess) {
      emit(SuccessGameListState(games: result.games));
    } else {
      emit(FailureGameListState());
    }
  }
}
