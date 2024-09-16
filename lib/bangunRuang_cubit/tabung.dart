import 'package:flutter/material.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';
import 'dart:math';

import 'package:project_belajar_cubit/reusable/reusableTextField.dart';

class LayarTabung extends StatefulWidget {
  @override
  _LayarTabungState createState() => _LayarTabungState();
}

class _LayarTabungState extends State<LayarTabung> {
  final _controllerJariJari = TextEditingController();
  final _controllerTinggi = TextEditingController();
  double? _volume;
  double? _luasPermukaan;

  void _hitung() {
    final jariJari = double.tryParse(_controllerJariJari.text);
    final tinggi = double.tryParse(_controllerTinggi.text);
    if (jariJari != null && tinggi != null) {
      setState(() {
        _volume = pi * pow(jariJari, 2) * tinggi;
        _luasPermukaan = 2 * pi * jariJari * (tinggi + jariJari);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Tabung'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextField(controller: _controllerJariJari, label: 'Jari-jari (cm)',keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ReusableTextField(controller: _controllerTinggi, label: 'Tinggi (cm)',keyboardType: TextInputType.number),
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
