import 'package:bmi/screens/start_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorScreen extends StatelessWidget {
  final int age;
  final int weight;
  final double height;
  CalculatorScreen({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(startBackgroundColor),
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(color: Color(mainColor)),
          ),
        ),
        elevation: 30,
        backgroundColor: Color(backgroundColor),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 25,
          bottom: 27,
        ),
        child: Column(
          spacing: 25,

          children: [
            Text(
              'Your Result',
              style: TextStyle(
                color: Color(mainColor),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 58, bottom: 33),
                    child: Text(
                      CalculateBMI.bmiCategory(
                        double.parse(
                          CalculateBMI.bmiValue(age, weight, height),
                        ),
                      ),
                      style: TextStyle(
                        color: Color(0xff21BF73),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    CalculateBMI.bmiValue(age, weight, height),
                    style: TextStyle(
                      fontSize: 64,
                      color: Color(mainColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      CalculateBMI.bmiInterpretation(
                        double.parse(
                          CalculateBMI.bmiValue(age, weight, height),
                        ),
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff8B8C9E),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        color: Color(0xffE83D67),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => StartScreen()),
          );
        },
        height: 100,
        child: Text(
          'Re - Calculate',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CalculateBMI {
  static String bmiValue(int age, int weight, double height) {
    double heightM = height / 100;
    double bmi = weight / (heightM * heightM);
    return bmi.toStringAsFixed(1);
  }

  static String bmiInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'You are underweight. Try to eat more nutritiously.';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'You have a normal body weight. Good job.';
    } else if (bmi >= 25 && bmi < 30) {
      return 'You are slightly overweight. Consider exercising regularly.';
    } else {
      return 'You are obese. It\'s recommended to consult a doctor.';
    }
  }

  static String bmiCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
