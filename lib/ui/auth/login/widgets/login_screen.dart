import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter_mvvm/ui/auth/login/widgets/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewmodel loginViewmodel;

  const LoginScreen({super.key, required this.loginViewmodel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LogoContainer(),
              LoginFormWidget(loginViewmodel: widget.loginViewmodel),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoContainer extends StatelessWidget {
  const _LogoContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Dummy App API',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
