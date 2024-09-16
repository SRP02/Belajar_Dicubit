import 'package:flutter/material.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';
import 'dart:math';

import 'package:project_belajar_cubit/reusable/reusableTextField.dart';

class LayarBola extends StatefulWidget {
  @override
  _LayarBolaState createState() => _LayarBolaState();
}

class _LayarBolaState extends State<LayarBola> {
  final _controllerJariJari = TextEditingController();
  double? _volume;
  double? _luasPermukaan;

  void _hitung() {
    final jariJari = double.tryParse(_controllerJariJari.text);
    if (jariJari != null) {
      setState(() {
        _volume = (4 / 3) * pi * pow(jariJari, 3);
        _luasPermukaan = 4 * pi * pow(jariJari, 2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bola'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextField(controller: _controllerJariJari, label: 'Jari-jari (cm)',keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ReusableButton(label: 'Hitung', onPressed: _hitung),
            if (_volume != null && _luasPermukaan != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Volume: ${_volume!.toStringAsFixed(2)} cm³'),
                  Text('Luas Permukaan: ${_luasPermukaan!.toStringAsFixed(2)} cm²'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
