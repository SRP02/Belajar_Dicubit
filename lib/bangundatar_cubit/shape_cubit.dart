import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/shapeModel_cubit.dart';
import 'dart:math';

class ShapeCubit extends Cubit<Map<String, ShapeModel>> {
  ShapeCubit() : super({});

  void calculateRectangle(double length, double width) {
    final area = length * width;
    final perimeter = 2 * (length + width);
    emit({...state, 'rectangle': ShapeModel(area: area, perimeter: perimeter)});
  }

  void calculateCircle(double radius) {
    final area = 3.14159 * radius * radius;
    final perimeter = 2 * 3.14159 * radius;
    emit({...state, 'circle': ShapeModel(area: area, perimeter: perimeter)});
  }

  void calculateTriangle(double a, double b, double c) {
    final s = (a + b + c) / 2;
    final area = sqrt(s * (s - a) * (s - b) * (s - c)); 
    final perimeter = a + b + c;
    emit({...state, 'triangle': ShapeModel(area: area, perimeter: perimeter)});
  }
}
