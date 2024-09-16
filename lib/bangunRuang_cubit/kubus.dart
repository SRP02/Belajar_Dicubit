import 'package:flutter/material.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';
import 'package:project_belajar_cubit/reusable/reusableTextField.dart';

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
            ReusableTextField(controller: _controllerSisi, label: 'Panjang Sisi (cm)',keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ReusableButton(label: 'Hitung', onPressed: _hitung),            
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
