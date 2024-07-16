import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../cubits/home_categories_cubit.dart';
import '../states/home_categories_state.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
  });

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final _categoriesCubit = GetIt.I.get<HomeCategoriesCubit>();

  @override
  void initState() {
    super.initState();
    _categoriesCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: GetIt.I.get<HomeCategoriesCubit>(),
      builder: (context, state) => switch (_categoriesCubit.state) {
        LoadingHomeCategoriesState() => const Center(
            child: CircularProgressIndicator(),
          ),
        (SuccessHomeCategoriesState successState) => SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: successState.listCategories.length,
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  //
                },
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.network(
                          successState.listCategories[index].imageUrl,
                          width: 48,
                          height: 48,
                        )),
                        Text(
                          successState.listCategories[index].name,
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
        _ => Container(),
      },
    );
  }
}
