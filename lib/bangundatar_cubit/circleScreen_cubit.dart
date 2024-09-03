import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shape_cubit.dart';
import 'shapeModel_cubit.dart';

class CircleScreen extends StatelessWidget {
  final TextEditingController _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _radiusController,
            decoration: InputDecoration(labelText: "Masukkan radius"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                 final radius = double.tryParse(_radiusController.text);
              if (radius != null) {
                context.read<ShapeCubit>().calculateCircle(radius);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a valid number')),
                );
              }
            },
            child: Text("Calculate"),
          ),
          SizedBox(height: 20),
          BlocBuilder<ShapeCubit, Map<String, ShapeModel>>(
            builder: (context, state) {
              final result = state['circle'];
              if (result == null) {
                return Text('No result yet');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Area: ${result.area.toStringAsFixed(2)}"),
                    Text("Circumference: ${result.perimeter.toStringAsFixed(2)}"),
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
