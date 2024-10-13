import 'package:flutter/material.dart';

class Authform {
  static Widget buildTextField({
    required String labelText,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    Function()? toggleobscureText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {},
                  )
                : null),
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
