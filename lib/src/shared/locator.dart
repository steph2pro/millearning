import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/datasource/http/Course_api.dart';
import 'package:millearnia/src/datasource/http/cv_api.dart';
import 'package:millearnia/src/datasource/http/profession_api.dart';
import 'package:millearnia/src/datasource/http/user_api.dart';
import 'package:millearnia/src/datasource/http/dio_config.dart';
import 'package:millearnia/src/datasource/http/example_api.dart';
import 'package:millearnia/src/datasource/http/random_user_api.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/datasource/repositories/course_repository.dart';
import 'package:millearnia/src/datasource/repositories/cv_repository.dart';
import 'package:millearnia/src/datasource/repositories/example_repository.dart';
import 'package:millearnia/src/datasource/repositories/profession_repository.dart';
import 'package:millearnia/src/datasource/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:millearnia/src/features/auth/register/logic/register_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    print('Registering UserApi');
    return UserApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering UserRepository');
    return UserRepository(userApi: locator<UserApi>());
  })
  ..registerLazySingleton(() {
    print('Registering SupabaseClient');
    return Supabase.instance.client;
  })
  ..registerLazySingleton(() {
    print('Registering CvApi');
    return CvApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering CvRepository');
    return CvRepository(cvApi: locator<CvApi>());
  })
  ..registerLazySingleton(() {
    print('Registering ProfessionApi');
    return ProfessionApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering ProfessionRepository');
    return ProfessionRepository(professionApi: locator<ProfessionApi>());
  })
  ..registerLazySingleton(() {
    print('Registering CourseApi');
    return CourseApi(dio: locator<DioConfig>().dio);
  })
  ..registerLazySingleton(() {
    print('Registering CourseRepository');
    return CourseRepository(courseApi: locator<CourseApi>());
  })
  ;