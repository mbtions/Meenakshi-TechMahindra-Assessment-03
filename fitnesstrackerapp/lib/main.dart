import 'package:fitnesstrackerapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessTrackerApp());
}

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
