import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<void> verifyLogin();
  Future<Result<void>> login({
    required String username,
    required String password,
  });
}
