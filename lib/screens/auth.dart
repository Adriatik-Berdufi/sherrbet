import 'package:flutter/material.dart';
import 'package:sherrbet/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  //chiave globale per il Form
  final _formKey = GlobalKey<FormState>();

  //controller per gli input
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

//toggle per la visivilita della password
  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('LogIn-SingUp'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Authform.buildTextField(
                    labelText: 'Nome', controller: _nomeController),
                const SizedBox(height: 10),
                Authform.buildTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  toggleobscureText: _toggleObscurePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
