import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/data/services/api/models/login_request.dart';
import 'package:flutter_mvvm/data/services/shared_preferencies_service.dart';
import 'package:flutter_mvvm/domain/models/user.dart';
import 'package:flutter_mvvm/utils/result.dart';

class AuthRepositoryRemote extends ChangeNotifier implements AuthRepository {
  final ApiClient _apiClient;
  final SharedPreferenciesService _sharedPreferenciesService;

  AuthRepositoryRemote({
    required this._apiClient,
    required this._sharedPreferenciesService,
  });

  @override
  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    final LoginRequest loginRequest = LoginRequest(
      username: username,
      password: password,
      expiresInMins: 30,
    );

    try {
      final result = await _apiClient.login(loginRequest);

      switch (result) {
        case Ok():
          final user = User(
            accessToken: result.value.accessToken,
            refreshToken: result.value.refreshToken,
            id: result.value.id,
            username: result.value.username,
            email: result.value.email,
            firstName: result.value.firstName,
            lastName: result.value.lastName,
            gender: result.value.gender,
            image: result.value.image,
          );
          await _sharedPreferenciesService.saveUser(user);
          break;
        default:
      }

      return result;
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    final result = await _sharedPreferenciesService.fetchUser();
    switch (result) {
      case Ok<User?>():
        return result.value != null;
      default:
        return false;
    }
  }

  @override
  Future<void> verifyLogin() async {
    await _sharedPreferenciesService.fetchUser();
    notifyListeners();
  }
}
