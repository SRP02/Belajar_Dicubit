import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/circleScreen_cubit.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/rectangleScreen_cubit.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/triangleScreen_cubit.dart';
import 'shape_cubit.dart';

class ShapeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShapeCubit(),
      child: MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Shape Calculator'),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Persegi panjang"),
                  Tab(text: "Lingkaran"),
                  Tab(text: "Segitiga"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                RectangleScreen(),
                CircleScreen(),
                TriangleScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
