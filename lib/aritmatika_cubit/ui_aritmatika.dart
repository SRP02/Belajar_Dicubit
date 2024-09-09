import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/aritmatika_cubit/calculator_cubit.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.black12,
                child: BlocBuilder<CalculatorCubit, String>(
                  builder: (context, state) {
                    return Text(
                      state,
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildCalculatorButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorButtons(BuildContext context) {
    final buttons = [
      '7', '8', '9', '/',
      '4', '5', '6', '*',
      '1', '2', '3', '-',
      '0', '.', '=', '+',
      'C'
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final button = buttons[index];
        return _buildButton(context, button);
      },
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(context, label),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: _isOperator(label) ? Colors.blueAccent : Colors.grey[300],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: _isOperator(label) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  bool _isOperator(String label) {
    return ['+', '-', '*', '/', '='].contains(label);
  }

  void _onButtonPressed(BuildContext context, String label) {
    final calculatorCubit = context.read<CalculatorCubit>();

    if (label == 'C') {
      calculatorCubit.clear();
    } else if (label == '=') {
      calculatorCubit.calculateResult();
    } else {
      calculatorCubit.input(label);
    }
  }
}
