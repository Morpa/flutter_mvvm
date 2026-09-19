import 'package:flutter_mvvm/utils/result.dart';

abstract class AuthRepository {
  Future<Result<void>> login({
    required String username,
    required String password,
  });
}
