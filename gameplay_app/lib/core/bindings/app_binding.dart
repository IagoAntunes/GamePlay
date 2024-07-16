import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/services/database/key_value/shared_preferences_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/secure_storage.dart';
import 'package:gameplay_app/services/http/dio_http_service.dart';
import 'package:gameplay_app/services/http/i_http_service.dart';
import 'package:gameplay_app/src/features/auth/datasource/datasource/auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/datasource/datasource/i_auth_datasource.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:gameplay_app/src/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../services/database/key_value/i_key_value_storage.dart';

class AppBinding {
  static Future<void> setUp() async {
    var getIt = GetIt.instance;

    _setUpSharedPackages();

    getIt.registerSingleton<ControlAuthCubit>(
      ControlAuthCubit(
        sharedPreferencesService: getIt(),
        secureStorage: getIt(),
      ),
    );
    getIt.registerFactory<IAuthDataSource>(
        () => AuthDataSource(httpService: getIt()));
    getIt.registerFactory<IAuthRepository>(
        () => AuthRepository(dataSource: getIt()));
    getIt.registerSingleton(
      AuthCubit(
        authRepository: getIt(),
        controlAuthCubit: getIt(),
      ),
    );
  }

  static Future<void> _setUpSharedPackages() async {
    var getIt = GetIt.instance;
    getIt.registerSingleton<ISecureStorage>(SecureStorage());
    getIt.registerSingleton<IHttpService>(DioHttpService());
    getIt.registerSingleton<IKeyValueStorage>(SharedPreferencesStorage());
  }
}
