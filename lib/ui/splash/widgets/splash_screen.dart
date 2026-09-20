import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';

class SplashScreen extends StatefulWidget {
  final AuthRepository _authRepository;

  const SplashScreen({super.key, required this._authRepository});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget._authRepository.verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
