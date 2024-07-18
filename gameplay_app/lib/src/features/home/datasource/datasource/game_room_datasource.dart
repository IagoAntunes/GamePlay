import 'package:dio/dio.dart';
import 'package:gameplay_app/core/response/base_api_response.dart';
import 'package:gameplay_app/core/url/app_api_urls.dart';
import 'package:gameplay_app/services/http/i_http_service.dart';
import 'package:gameplay_app/src/features/create_game_room/domain/requests/create_game_room_request.dart';
import 'package:gameplay_app/src/features/game_room_info/domain/requests/enter_game_room_request.dart';
import 'package:gameplay_app/src/features/home/datasource/datasource/i_game_room_datasource.dart';

class GameRoomDataSource implements IGameRoomDataSource {
  GameRoomDataSource({required IHttpService httpService})
      : _httpService = httpService;
  final IHttpService _httpService;

  @override
  Future<IBaseApiResponse> getAll() async {
    try {
      final result = await _httpService.get(AppApiUrls.getAllGameRoom);

      if (result!.statusCode! >= 200 && result.statusCode! < 300) {
        return ResponseApiData.success(result.data, result.statusCode);
      }
      return ResponseApiData.failure(
        result.data,
        result.statusCode,
      );
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }

  @override
  Future<IBaseApiResponse> createGameRoom(CreateGameRoomRequest request) async {
    try {
      final result = await _httpService.post(
        AppApiUrls.createGameRoom,
        request.toMap(),
      );

      if (result!.statusCode! >= 200 && result.statusCode! < 300) {
        return ResponseApiData.success(result.data, result.statusCode);
      }
      return ResponseApiData.failure(
        result.data,
        result.statusCode,
      );
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }

  @override
  Future<IBaseApiResponse> enterGameRoom(EnterGameRoomRequest request) async {
    try {
      final result = await _httpService.post(
        AppApiUrls.enterGameRoom,
        request.toMap(),
      );

      if (result!.statusCode! >= 200 && result.statusCode! < 300) {
        return ResponseApiData.success(result.data, result.statusCode);
      }
      return ResponseApiData.failure(
        result.data,
        result.statusCode,
      );
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }
}
