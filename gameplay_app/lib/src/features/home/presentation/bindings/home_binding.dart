import 'package:gameplay_app/src/features/home/datasource/datasource/categories_datasource.dart';
import 'package:gameplay_app/src/features/home/datasource/datasource/game_room_datasource.dart';
import 'package:gameplay_app/src/features/home/datasource/datasource/i_categories_datasource.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/game_room_repository.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/home_categories_repository.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_game_room_repository.dart';
import 'package:gameplay_app/src/features/home/domain/repositories/i_home_categories_repository.dart';
import 'package:gameplay_app/src/features/home/presentation/cubits/home_categories_cubit.dart';
import 'package:gameplay_app/src/features/home/presentation/cubits/home_cubit.dart';
import 'package:gameplay_app/src/features/home/presentation/cubits/home_list_game_room_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../datasource/datasource/i_game_room_datasource.dart';

class HomeBinding {
  static Future<void> setUp() async {
    var getIt = GetIt.instance;
    setUpHomeListGameRoom();
    getIt.registerFactory<ICategoriesDataSource>(
        () => CategoriesDataSource(httpService: getIt()));
    getIt.registerFactory<IHomeCategoriesRepository>(
        () => HomeCategoriesRepository(categoriesDataSource: getIt()));

    getIt.registerSingleton(
      HomeCategoriesCubit(
        homeCategoriesRepository: getIt(),
      ),
    );

    getIt.registerSingleton<HomeCubit>(HomeCubit(keyValueStorage: getIt()));
  }

  static Future<void> setUpHomeListGameRoom() async {
    var getIt = GetIt.instance;
    getIt.registerFactory<IGameRoomDataSource>(
        () => GameRoomDataSource(httpService: getIt()));
    getIt.registerFactory<IGameRoomRepository>(
        () => GameRoomRepository(gameRoomDataSource: getIt()));

    getIt.registerSingleton(
      HomeListGameRoomCubit(
        gameRoomRepository: getIt(),
      ),
    );
  }
}
