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
  final TextEditingController _cognomeController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

//VALIDAZIONE CAMPI INPUT

  //validazione nome congome e Nickname
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obbligatorio';
    }
    return null;
  }

  //validazione mail
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci una Email';
    }
    const emailRegex = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Inserisci un\'email valida';
    }
    return null;
  }

  //validazione password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci una password';
    } else if (value.length < 8) {
      return 'La password deve avere almeno 8 caratteri';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'La password deve contenere almeno una lettera minuscola';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La password deve contenere almeno una lettera maiuscola';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'La password deve contenere almeno un numero';
    } else if (!RegExp(r'[!@#$%&*?]').hasMatch(value)) {
      return 'La password deve contenere almeno un carattere speciale';
    }
    return null;
  }

  //validazione password
  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Le password non coincidono';
    }
    return null;
  }

//FUNZIONE PER INVIARE IL FORM
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('form completto pronto per Invio');
    }
  }

//TOOGLE per la visivilita della password
  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmObscurePassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('LogIn-SingUp'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(193, 30, 87, 185),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            //padding: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 9, 9, 9).withOpacity(0.3),
                      spreadRadius: -17,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Card(
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 36.0),
                    child: Column(
                      children: [
                        Authform.buildTextField(
                          labelText: 'Nome',
                          controller: _nomeController,
                          validator: _validateField,
                        ),
                        Authform.buildTextField(
                          labelText: 'Cognome',
                          controller: _cognomeController,
                          validator: _validateField,
                        ),
                        Authform.buildTextField(
                          labelText: 'NickName',
                          controller: _nickNameController,
                          validator: _validateField,
                        ),
                        Authform.buildTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          validator: _validateEmail,
                        ),
                        Authform.buildTextField(
                            labelText: 'Password',
                            controller: _passwordController,
                            isPasswordField: true,
                            obscureText: _obscurePassword,
                            toggleobscureText: _toggleObscurePassword,
                            validator: _validatePassword),
                        Authform.buildTextField(
                          labelText: 'Confirm Password',
                          controller: _confirmPasswordController,
                          isPasswordField: true,
                          obscureText: _obscureConfirmPassword,
                          toggleobscureText: _toggleConfirmObscurePassword,
                          validator: _validateConfirmPassword,
                        ),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Registrati'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Hai gia un account.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
