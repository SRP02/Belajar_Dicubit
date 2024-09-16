import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/reusable/reusableButton.dart';
import 'package:project_belajar_cubit/reusable/reusableTextField.dart';
import 'shape_cubit.dart';
import 'shapeModel_cubit.dart';

class RectangleScreen extends StatelessWidget {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ReusableTextField(controller: _lengthController, label: 'Panjang', keyboardType: TextInputType.number),
          SizedBox(height: 10),
          ReusableTextField(controller: _widthController, label: 'Lebar', keyboardType: TextInputType.number),
          SizedBox(height: 20),
          ReusableButton(label: 'Calculate', onPressed: (){
              final length = double.tryParse(_lengthController.text);
              final width = double.tryParse(_widthController.text);
              if (length != null && width != null) {
                context.read<ShapeCubit>().calculateRectangle(length, width);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter valid numbers')),
                );
              }}
          ),
          SizedBox(height: 20),
          BlocBuilder<ShapeCubit, Map<String, ShapeModel>>(
            builder: (context, state) {
              final result = state['rectangle'];
              if (result == null) {
                return Text('No result yet');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Area: ${result.area.toStringAsFixed(2)}"),
                    Text("Perimeter: ${result.perimeter.toStringAsFixed(2)}"),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
