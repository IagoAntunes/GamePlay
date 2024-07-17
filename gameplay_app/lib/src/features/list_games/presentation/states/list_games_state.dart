import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';

abstract class IGameListState {
  //
}

class IdleGameListState extends IGameListState {}

class LoadingGameListState extends IGameListState {}

class FailureGameListState extends IGameListState {}

class SuccessGameListState extends IGameListState {
  SuccessGameListState({required this.games});
  List<GameModel> games;
}
