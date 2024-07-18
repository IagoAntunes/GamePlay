import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/create_game_room/presentation/cubits/create_gameroom_cubit.dart';
import 'package:gameplay_app/src/features/home/domain/models/category_model.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../cubits/create_gameroom_categories_cubit.dart';
import '../states/create_gameroom_categories_state.dart';

class CreateGameRoomCategories extends StatefulWidget {
  const CreateGameRoomCategories({
    super.key,
    this.selectedCategory,
    required this.createGameRoomCubit,
  });

  final CategoryModel? selectedCategory;
  final CreateGameRoomCubit createGameRoomCubit;

  @override
  State<CreateGameRoomCategories> createState() =>
      _CreateGameRoomCategoriesState();
}

class _CreateGameRoomCategoriesState extends State<CreateGameRoomCategories> {
  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory?.id ?? 0;
    _createGameRoomCategoriesCubit.getCategories();
  }

  int _selectedCategory = 0;
  final _createGameRoomCategoriesCubit =
      GetIt.I.get<CreateGameRoomCategoriesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _createGameRoomCategoriesCubit,
      builder: (context, state) =>
          switch (_createGameRoomCategoriesCubit.state) {
        LoadingCreateGameRoomCategoriesState() => const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        (SuccessCreateGameRoomCategoriesState successState) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Categoria",
                style: TextStyle(
                  color: AppColors.textHeading,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: successState.categories.length,
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        _selectedCategory = successState.categories[index].id;
                      });
                      widget.createGameRoomCubit
                          .setCategory(successState.categories[index]);
                    },
                    child: Opacity(
                      opacity:
                          _selectedCategory == successState.categories[index].id
                              ? 1
                              : 0.5,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 104,
                          minHeight: 120,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: AppColors.stroke1,
                            ),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.boxes2,
                              AppColors.boxes1,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network(
                                successState.categories[index].imageUrl,
                                width: 48,
                                height: 48,
                              )),
                              Text(
                                successState.categories[index].name,
                                style: const TextStyle(
                                  color: AppColors.textHeading,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        _ => Container(),
      },
    );
  }
}
