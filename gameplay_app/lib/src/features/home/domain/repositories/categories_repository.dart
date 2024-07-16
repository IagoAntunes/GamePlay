import 'package:gameplay_app/src/features/home/datasource/datasource/i_categories_datasource.dart';
import 'package:gameplay_app/src/features/home/domain/models/category_model.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_home_categories_repository.dart';
import 'package:gameplay_app/src/features/home/domain/results/get_home_categories_result.dart';

class CategoriesRepository implements ICategoriesRepository {
  CategoriesRepository({required ICategoriesDataSource categoriesDataSource})
      : _categoriesDataSource = categoriesDataSource;

  final ICategoriesDataSource _categoriesDataSource;

  @override
  Future<GetHomeCategoriesResult> getCategories() async {
    final result = await _categoriesDataSource.getCategories();
    print(result);

    List<CategoryModel> listCategories = [];

    for (var category in result.result!['list']) {
      listCategories.add(CategoryModel.fromMap(category));
    }

    return GetHomeCategoriesResult(
      message: result.message,
      isSuccess: result.isSuccess,
      categories: listCategories,
    );
  }
}
