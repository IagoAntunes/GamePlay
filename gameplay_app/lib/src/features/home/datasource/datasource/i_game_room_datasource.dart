import 'package:gameplay_app/core/response/base_api_response.dart';

import '../../../create_game_room/domain/requests/create_game_room_request.dart';

abstract class IGameRoomDataSource {
  Future<IBaseApiResponse> getAll();
  Future<IBaseApiResponse> createGameRoom(CreateGameRoomRequest request);
}
