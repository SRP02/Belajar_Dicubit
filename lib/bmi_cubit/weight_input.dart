import 'package:flutter/material.dart';

class WeightInput extends StatelessWidget {
  final TextEditingController controller;

  WeightInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Weight (kg)',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
