import '../../../home/domain/models/category_model.dart';

abstract class ICreateGameRoomState {}

class IdleCreateGameRoomState extends ICreateGameRoomState {}

class LoadingCreateGameRoomState extends ICreateGameRoomState {}

class SuccessCreateGameRoomState extends ICreateGameRoomState {
  SuccessCreateGameRoomState({
    required this.listCategories,
  });
  List<CategoryModel> listCategories;
}

class FailureCreateGameRoomState extends ICreateGameRoomState {}
