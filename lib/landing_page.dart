import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shape_calculator');
              },
              child: const Text('Kalkulator bangun datar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Kalkulator_bangunRuang');
              },
              child: const Text('Kalkulator bangun ruang'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Kalkulator_bmi');
              },
              child: const Text('/Kalkulator BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
