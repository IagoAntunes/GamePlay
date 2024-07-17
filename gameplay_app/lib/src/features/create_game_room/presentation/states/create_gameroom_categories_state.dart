import 'package:gameplay_app/src/features/home/domain/models/category_model.dart';

abstract class ICreateGameRoomCategoriesState {}

class IdleCreateGameRoomCategoriesState
    extends ICreateGameRoomCategoriesState {}

class LoadingCreateGameRoomCategoriesState
    extends ICreateGameRoomCategoriesState {}

class SuccessCreateGameRoomCategoriesState
    extends ICreateGameRoomCategoriesState {
  List<CategoryModel> categories;
  SuccessCreateGameRoomCategoriesState({
    required this.categories,
  });
}

class FailureCreateGameRoomCategoriesState
    extends ICreateGameRoomCategoriesState {}
