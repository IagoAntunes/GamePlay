import 'package:dio/dio.dart';
import 'package:gameplay_app/core/response/base_api_response.dart';
import 'package:gameplay_app/core/url/app_api_urls.dart';
import 'package:gameplay_app/services/http/i_http_service.dart';
import 'package:gameplay_app/src/features/list_games/datasource/datasource/i_games_datasource.dart';

class GamesDataSource extends IGamesDataSource {
  GamesDataSource({required IHttpService httpService})
      : _httpService = httpService;
  final IHttpService _httpService;

  @override
  Future<IBaseApiResponse> getGames() async {
    try {
      final result = await _httpService.get(AppApiUrls.getGames);

      if (result!.statusCode == 200) {
        return ResponseApiData.success(result.data, result.statusCode);
      } else {
        return ResponseApiData.failure(result.data, result.statusCode);
      }
    } on DioException catch (e) {
      return ResponseApiData.failure(e.response!.data, e.response!.statusCode);
    } catch (e) {
      return ResponseApiData.failure({}, 500);
    }
  }
}
