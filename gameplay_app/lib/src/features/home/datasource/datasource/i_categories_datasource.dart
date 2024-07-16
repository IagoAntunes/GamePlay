import '../../../../../core/response/base_api_response.dart';

abstract class ICategoriesDataSource {
  Future<IBaseApiResponse> getCategories();
}
