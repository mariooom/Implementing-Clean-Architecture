// lib/injection_container.dart
import 'package:clean_arch/core/network/dio_client.dart';
import 'package:clean_arch/data/datasources/user_data_source.dart';
import 'package:clean_arch/data/repositories/user_repositories_impl.dart';
import 'package:clean_arch/domain/repositories/user_repositories.dart';
import 'package:clean_arch/domain/usecases/fetch_user.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void init() {
  // Register DioClient
  sl.registerLazySingleton(() => DioClient());

  // Register Data Sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(sl()),
  );

  // Register Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl()),
  );

  // Register Use Cases
  sl.registerLazySingleton(() => FetchUsers(sl()));
}