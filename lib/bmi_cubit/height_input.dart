import 'package:flutter/material.dart';

class HeightInput extends StatelessWidget {
  final TextEditingController controller;

  HeightInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Height (cm)',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
