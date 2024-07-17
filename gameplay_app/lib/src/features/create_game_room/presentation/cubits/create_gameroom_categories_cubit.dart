import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/create_game_room/presentation/states/create_gameroom_categories_state.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_home_categories_repository.dart';

class CreateGameRoomCategoriesCubit
    extends Cubit<ICreateGameRoomCategoriesState> {
  CreateGameRoomCategoriesCubit(
      {required ICategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(IdleCreateGameRoomCategoriesState());

  final ICategoriesRepository _categoriesRepository;

  Future<void> getCategories() async {
    emit(LoadingCreateGameRoomCategoriesState());
    final result = await _categoriesRepository.getCategories();
    if (result.isSuccess) {
      emit(SuccessCreateGameRoomCategoriesState(categories: result.categories));
    } else {
      emit(FailureCreateGameRoomCategoriesState());
    }
  }
}
