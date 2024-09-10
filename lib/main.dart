import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_belajar_cubit/aritmatika_cubit/calculator_cubit.dart';
import 'package:project_belajar_cubit/aritmatika_cubit/ui_aritmatika.dart';
import 'package:project_belajar_cubit/bangunRuang_cubit/bangunRuang_cubit.dart';
import 'package:project_belajar_cubit/bangundatar_cubit/shapeCalculator_cubit.dart';
import 'package:project_belajar_cubit/bmi_cubit/bmi_calculator.dart';
import 'package:project_belajar_cubit/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Cubit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/shape_calculator': (context) => ShapeCalculatorApp(),
        '/Kalkulator_bangunRuang': (context) => kalkulator_bangun_ruang(),
        '/Kalkulator_bmi': (context) => BMICalculator(),
        '/arithmetic_calculator': (context) => BlocProvider(
          create: (_) => CalculatorCubit(),
          child: CalculatorPage(),
        ),
      },
    );
  }
}
