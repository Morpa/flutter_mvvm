import 'package:flutter_mvvm/domain/models/user.dart';
import 'package:flutter_mvvm/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenciesService {
  static const String _userKey = "userKey";

  Future<Result<void>> saveUser(User user) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(_userKey, user.toJson());
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<User?>> fetchUser() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final result = sharedPreferences.getString(_userKey);
      if (result == null) {
        return Result.ok(null);
      }
      return Result.ok(User.fromJson(result));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
