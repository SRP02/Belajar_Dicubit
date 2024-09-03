import 'package:flutter/material.dart';
import 'dart:math';

class LayarKerucut extends StatefulWidget {
  @override
  _LayarKerucutState createState() => _LayarKerucutState();
}

class _LayarKerucutState extends State<LayarKerucut> {
  final _controllerJariJari = TextEditingController();
  final _controllerTinggi = TextEditingController();
  double? _volume;
  double? _luasPermukaan;

  void _hitung() {
    final jariJari = double.tryParse(_controllerJariJari.text);
    final tinggi = double.tryParse(_controllerTinggi.text);
    if (jariJari != null && tinggi != null) {
      setState(() {
        _volume = (1 / 3) * pi * pow(jariJari, 2) * tinggi;
        double garisPelukis = sqrt(pow(tinggi, 2) + pow(jariJari, 2));
        _luasPermukaan = pi * jariJari * (jariJari + garisPelukis);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Kerucut'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controllerJariJari,
              decoration: InputDecoration(
                labelText: 'Jari-jari (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controllerTinggi,
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitung,
              child: Text('Hitung'),
            ),
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
