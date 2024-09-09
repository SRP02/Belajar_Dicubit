import 'package:bloc/bloc.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super('0');

  String _input = '';
  String _operator = '';
  double? _firstOperand;
  double? _secondOperand;

  void input(String value) {
    // Handle operator input
    if (_isOperator(value)) {
      if (_input.isNotEmpty && _firstOperand == null) {
        _firstOperand = double.tryParse(_input);
        _input = '';
      }
      _operator = value;
    }
    // Handle numeric and decimal input
    else if (value == '.' && _input.contains('.')) {
      return; // Prevent multiple decimal points
    } else {
      _input += value;
      emit(_input.isEmpty ? '0' : _input);
    }
  }

  void calculateResult() {
    if (_input.isNotEmpty && _firstOperand != null && _operator.isNotEmpty) {
      _secondOperand = double.tryParse(_input);

      if (_secondOperand != null) {
        final result = _calculate(_firstOperand!, _secondOperand!, _operator);
        emit(result != null ? result.toString() : 'Error');
      } else {
        emit('Error');
      }
      _resetCalculator();
    } else {
      emit('0');
    }
  }

  void clear() {
    _resetCalculator();
    emit('0');
  }

  double? _calculate(double firstOperand, double secondOperand, String operator) {
    switch (operator) {
      case '+':
        return firstOperand + secondOperand;
      case '-':
        return firstOperand - secondOperand;
      case '*':
        return firstOperand * secondOperand;
      case '/':
        return secondOperand != 0 ? firstOperand / secondOperand : null;
      default:
        return null;
    }
  }

  bool _isOperator(String value) {
    return ['+', '-', '*', '/'].contains(value);
  }

  void _resetCalculator() {
    _input = '';
    _operator = '';
    _firstOperand = null;
    _secondOperand = null;
  }
}
