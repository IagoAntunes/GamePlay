import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';

import '../states/create_gameroom_state.dart';

class CreateGameRoomCubit extends Cubit<ICreateGameRoomState> {
  CreateGameRoomCubit() : super(IdleCreateGameRoomState());

  String _dayMonth = '';
  String _time = '';

  GameModel? _gameSelected;

  GameModel? get gameSelected => _gameSelected;

  void setDayMonth(String dayMonth) {
    _dayMonth = dayMonth;
  }

  void setTime(String time) {
    _time = time;
  }

  void _setGame() {
    //
  }
}
