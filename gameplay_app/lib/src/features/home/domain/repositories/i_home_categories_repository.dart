import 'package:gameplay_app/src/features/home/domain/results/get_home_categories_result.dart';

abstract class IHomeCategoriesRepository {
  Future<GetHomeCategoriesResult> getCategories();
}
