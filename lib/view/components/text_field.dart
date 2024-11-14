import 'package:flutter/material.dart';

Widget campoTexto(String label, TextEditingController controller, IconData icon, {bool senha = false}) {
  return TextFormField(
    controller: controller,
    obscureText: senha,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor, insira $label';
      }
      return null;
    },
  );
}
