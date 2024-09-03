import 'package:bloc/bloc.dart';

class BMICubit extends Cubit<double?> {
  BMICubit() : super(null);

  void calculateBMI(double height, double weight) {
    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      emit(bmi);
    } else {
      emit(null); // Reset the state if invalid values are provided
    }
  }
}
