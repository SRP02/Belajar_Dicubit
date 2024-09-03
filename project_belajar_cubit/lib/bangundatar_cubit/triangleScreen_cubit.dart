import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/shapeModel_cubit.dart';
import 'shape_cubit.dart';

class TriangleScreen extends StatelessWidget {
  final TextEditingController _sideAController = TextEditingController();
  final TextEditingController _sideBController = TextEditingController();
  final TextEditingController _sideCController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _sideAController,
            decoration: InputDecoration(labelText: "Sisi A"),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _sideBController,
            decoration: InputDecoration(labelText: "Sisi B"),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _sideCController,
            decoration: InputDecoration(labelText: "Sisi C"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final a = double.tryParse(_sideAController.text);
              final b = double.tryParse(_sideBController.text);
              final c = double.tryParse(_sideCController.text);
              if (a != null && b != null && c != null) {
                context.read<ShapeCubit>().calculateTriangle(a, b, c);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter valid numbers')),
                );
              }
            },
            child: Text("Calculate"),
          ),
          SizedBox(height: 20),
          BlocBuilder<ShapeCubit, Map<String, ShapeModel>>(
            builder: (context, state) {
              final result = state['triangle'];
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
