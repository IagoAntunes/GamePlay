import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_home_categories_repository.dart';

import '../states/create_gameroom_state.dart';

class CreateGameRoomCategoriesCubit extends Cubit<ICreateGameRoomState> {
  CreateGameRoomCategoriesCubit(
      {required ICategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(IdleCreateGameRoomState());

  final ICategoriesRepository _categoriesRepository;

  Future<void> getCategories() async {
    emit(LoadingCreateGameRoomState());
    final result = await _categoriesRepository.getCategories();
    if (result.isSuccess) {
      emit(SuccessCreateGameRoomState(listCategories: result.categories));
    } else {
      emit(FailureCreateGameRoomState());
    }
  }
}
