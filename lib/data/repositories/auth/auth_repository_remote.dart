import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/data/services/api/models/login_request.dart';
import 'package:flutter_mvvm/utils/result.dart';

class AuthRepositoryRemote implements AuthRepository {
  final ApiClient _apiClient;

  const AuthRepositoryRemote({required this._apiClient});

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

    return await _apiClient.login(loginRequest);
  }
}
