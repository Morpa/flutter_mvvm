import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:flutter_mvvm/utils/command.dart';
import 'package:flutter_mvvm/utils/result.dart';

class LoginViewmodel {
  final AuthRepository _authRepository;

  LoginViewmodel({required this._authRepository});

  late final login = Command1(_login);

  Future<Result<void>> _login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );

    print(result.toString());

    return result;
  }
}
