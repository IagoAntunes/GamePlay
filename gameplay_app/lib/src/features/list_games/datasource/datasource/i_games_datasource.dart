import 'package:gameplay_app/core/response/base_api_response.dart';

abstract class IGamesDataSource {
  Future<IBaseApiResponse> getGames();
}
