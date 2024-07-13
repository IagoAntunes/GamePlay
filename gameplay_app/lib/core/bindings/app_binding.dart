import 'package:dio/dio.dart';
import 'package:gameplay_app/src/features/auth/datasource/datasource/auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/datasource/datasource/i_auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:get_it/get_it.dart';

class AppBinding {
  static void setUp() {
    var getIt = GetIt.instance;
    getIt.registerFactory(() => Dio());
    getIt.registerFactory<IAuthDataSource>(() => AuthDataSource(dio: getIt()));
    getIt.registerFactory<IAuthRepository>(
        () => AuthRepository(dataSource: getIt()));
    getIt.registerSingleton(AuthCubit(authRepository: getIt()));
  }
}
