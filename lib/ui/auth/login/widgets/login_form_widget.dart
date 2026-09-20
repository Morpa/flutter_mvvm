import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/auth/login/view_models/login_viewmodel.dart';

class LoginFormWidget extends StatefulWidget {
  final LoginViewmodel loginViewmodel;

  const LoginFormWidget({super.key, required this.loginViewmodel});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    widget.loginViewmodel.login.addListener(_onResult);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          Column(
            children: [
              Row(children: [Text('Usuário')]),
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o usuário';
                  }
                  return null;
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
          Column(
            children: [
              Row(children: [Text('Senha')]),
              TextFormField(
                obscureText: isPasswordVisible,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a senha';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: toggleVisibilit,
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: widget.loginViewmodel.login,
            builder: (context, child) {
              final running = widget.loginViewmodel.login.running;

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: _validateForm,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: running
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        )
                      : Text('Login', style: TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void toggleVisibilit() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      final username = usernameController.text;
      final password = passwordController.text;

      await widget.loginViewmodel.login.execute((username, password));
    }
  }

  void _onResult() {
    final command = widget.loginViewmodel.login;
    if (command.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('As credenciais não são válidas!'),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (command.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login realizado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    widget.loginViewmodel.login.removeListener(_onResult);
    super.dispose();
  }
}
