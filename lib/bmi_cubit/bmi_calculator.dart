import 'package:flutter/material.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';
import 'package:project_belajar_cubit/reusable/reusableTextField.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? bmiResult;
  String? bmiCategory;

  void calculateBMI() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
        bmiCategory = _getBMICategory(bmi);
      });
    } else {
      setState(() {
        bmiResult = null;
        bmiCategory = null;
      });
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      backgroundColor: Color(0xFF55EEC4),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableTextField(controller: heightController, label: 'Height (cm)',keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            ReusableTextField(controller: weightController, label: 'Weight (kg)',keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            ReusableButton(label: 'Calculate', onPressed: calculateBMI),
            const SizedBox(height: 16),
            Text(
              bmiResult ?? 'Please enter valid values',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Icon(
              Icons.person,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              bmiCategory ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
