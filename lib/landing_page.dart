import 'package:flutter/material.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';

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
            ReusableButton(
              label: 'Kalkulator bangun datar',
              onPressed: () {
                Navigator.pushNamed(context, '/shape_calculator');
              },
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            ReusableButton(
              label: 'Kalkulator bangun ruang',
              onPressed: () {
                Navigator.pushNamed(context, '/Kalkulator_bangunRuang');
              },
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            ReusableButton(
              label: 'Kalkulator BMI',
              onPressed: () {
                Navigator.pushNamed(context, '/Kalkulator_bmi');
              },
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            ReusableButton(
              label: 'Kalkulator Aritmatika',
              onPressed: () {
                Navigator.pushNamed(context, '/arithmetic_calculator');
              },
              color: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
