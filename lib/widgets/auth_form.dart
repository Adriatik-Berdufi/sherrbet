import 'package:flutter/material.dart';

class Authform {
  static Widget buildTextField({
    required String labelText,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    Function()? toggleobscureText,
    bool isPasswordField = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              suffixIcon: isPasswordField
                  ? IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: toggleobscureText,
                    )
                  : null,
            ),
            validator: validator,
            obscureText: obscureText,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
