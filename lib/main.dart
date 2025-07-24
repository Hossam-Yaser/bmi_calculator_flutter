import 'package:bmi/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
