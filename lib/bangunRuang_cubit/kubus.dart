import 'package:flutter/material.dart';

class LayarKubus extends StatefulWidget {
  @override
  _LayarKubusState createState() => _LayarKubusState();
}

class _LayarKubusState extends State<LayarKubus> {
  final _controllerSisi = TextEditingController();
  double? _volume;
  double? _luasPermukaan;

  void _hitung() {
    final sisi = double.tryParse(_controllerSisi.text);
    if (sisi != null) {
      setState(() {
        _volume = sisi * sisi * sisi;
        _luasPermukaan = 6 * (sisi * sisi);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Kubus'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controllerSisi,
              decoration: InputDecoration(
                labelText: 'Panjang Sisi (cm)',
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
                  Text('Volume: $_volume cm³'),
                  Text('Luas Permukaan: $_luasPermukaan cm²'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
