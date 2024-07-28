import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  NumberInput({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
    );
  }
}
