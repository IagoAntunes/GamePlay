import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_home_categories_repository.dart';
import 'package:gameplay_app/src/features/home/presentation/states/home_categories_state.dart';

class HomeCategoriesCubit extends Cubit<IHomeCategoriesState> {
  HomeCategoriesCubit({
    required IHomeCategoriesRepository homeCategoriesRepository,
  })  : _homeCategoriesRepository = homeCategoriesRepository,
        super(IdleHomeCategoriesState());

  final IHomeCategoriesRepository _homeCategoriesRepository;

  void getCategories() async {
    emit(LoadingHomeCategoriesState());
    final result = await _homeCategoriesRepository.getCategories();
    if (result.isSuccess) {
      emit(SuccessHomeCategoriesState(listCategories: result.categories));
    } else {
      emit(FailureHomeCategoriesState());
    }
  }
}
