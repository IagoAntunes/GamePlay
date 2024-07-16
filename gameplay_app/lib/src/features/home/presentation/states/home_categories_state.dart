import '../../domain/models/category_model.dart';

abstract class IHomeCategoriesState {}

class IdleHomeCategoriesState extends IHomeCategoriesState {}

class LoadingHomeCategoriesState extends IHomeCategoriesState {}

class SuccessHomeCategoriesState extends IHomeCategoriesState {
  List<CategoryModel> listCategories;
  SuccessHomeCategoriesState({
    required this.listCategories,
  });
}

class FailureHomeCategoriesState extends IHomeCategoriesState {}
