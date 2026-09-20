import 'package:dio/dio.dart';
import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:flutter_mvvm/data/repositories/auth/auth_repository_remote.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerSingleton<ApiClient>(
    ApiClient(apiURL: 'https://dummyjson.com', dio: Dio()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryRemote(apiClient: getIt()),
  );
}
