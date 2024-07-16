import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';

import '../states/home_list_game_room_state.dart';

class HomeListGameRoomCubit extends Cubit<IHomeListGameRoomState> {
  HomeListGameRoomCubit({
    required IGameRoomRepository gameRoomRepository,
  })  : _gameRoomRepository = gameRoomRepository,
        super(IdleHomeListGameRoomState());

  final IGameRoomRepository _gameRoomRepository;

  void getAllGameRooms() async {
    emit(LoadingHomeListGameRoomState());
    var result = await _gameRoomRepository.getAll();
    if (result.isSuccess) {
      emit(SuccessHomeListGameRoomState(gameRooms: result.gameRooms));
    } else {
      emit(FailureHomeListGameRoomState());
    }
  }
}
