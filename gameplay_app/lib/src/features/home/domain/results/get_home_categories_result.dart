import '../models/category_model.dart';

class GetHomeCategoriesResult {
  String message;
  bool isSuccess;
  List<CategoryModel> categories;
  GetHomeCategoriesResult({
    required this.message,
    required this.isSuccess,
    required this.categories,
  });
}
