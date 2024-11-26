import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/datasource/http/user_api.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/example_api.dart';
import 'package:millearnia/src/datasource/http/random_user_api.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/datasource/repositories/example_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:millearnia/src/features/auth/register/logic/register_cubit.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() {
    print('Registering DioConfig');
    return DioConfig();
  })
  ..registerLazySingleton(() {
    print('Registering AppRouter');
    return AppRouter();
  })
  ..registerLazySingleton(() {
    print('Registering ExampleApi');
    return ExampleApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering ExampleRepository');
    return ExampleRepository();
  })
  ..registerLazySingleton(() {
    print('Registering RandomUserApi');
    return RandomUserApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering RandomUserApi');
    return UserApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering UserRepository');
    return UserRepository(userApi: locator<UserApi>());
  })
  ;