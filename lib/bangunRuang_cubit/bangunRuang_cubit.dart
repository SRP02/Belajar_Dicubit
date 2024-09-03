import 'package:flutter/material.dart';
import 'kubus.dart';
import 'bola.dart';
import 'tabung.dart';
import 'kerucut.dart';


class kalkulator_bangun_ruang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Bangun Ruang',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LayarPilihanBangun(),
    );
  }
}

class LayarPilihanBangun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Ruang'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Kubus'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayarKubus()),
              );
            },
          ),
          ListTile(
            title: Text('Bola'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayarBola()),
              );
            },
          ),
          ListTile(
            title: Text('Tabung'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayarTabung()),
              );
            },
          ),
          ListTile(
            title: Text('Kerucut'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayarKerucut()),
              );
            },
          ),
        ],
      ),
    );
  }
}
