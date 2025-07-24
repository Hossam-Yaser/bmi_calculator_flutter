import 'package:bmi/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widgets/text_icons_container_widget.dart';
import 'package:bmi/widgets/below_container_widget.dart';

const int mainColor = 0xffFFFFFF;
const int backgroundColor = 0xff24263B;
const int startBackgroundColor = 0xff1C2135; //333244
const int textColor = 0xff8B8C9E;
const int secondIconColor = 0xff333244;

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _height = 150;
  int _weight = 60;
  int _age = 20;

  bool isMale = true;
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
          top: 20,
          bottom: 27,
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              spacing: 9,
              children: [
                TextIconsContainerWidget(
                  imagePath: 'assets/images/male_vector.png',
                  containerBackgroundColor: startBackgroundColor,
                  label: 'Male',
                  isSelected: isMale,
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                ),

                TextIconsContainerWidget(
                  imagePath: 'assets/images/female_vector.png',
                  containerBackgroundColor: secondIconColor,
                  label: 'Female',
                  isSelected: !isMale,
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                ),
              ],
            ),

            Container(
              height: 189,
              width: 319,
              decoration: BoxDecoration(
                color: Color(secondIconColor),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                children: [
                  Text(
                    'Height',
                    style: TextStyle(color: Color(textColor), fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$_height',
                        style: TextStyle(color: Color(mainColor), fontSize: 40),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: Color(mainColor), fontSize: 15),
                      ),
                    ],
                  ),
                  Slider(
                    value: _height,
                    min: 70,
                    max: 200,
                    divisions: 130,
                    activeColor: Color(0xffE83D67),
                    inactiveColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        _height = val;
                      });
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  BelowContainerWidget(
                    indicatorValue: _weight,
                    onValueChanged: (val) {
                      setState(() {
                        _weight = val;
                      });
                    },
                  ),

                  BelowContainerWidget(
                    mainText: 'Age',
                    widgetColor: 0xff333244,
                    indicatorValue: _age,
                    onValueChanged: (val) {
                      setState(() {
                        _age = val;
                      });
                    },
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CalculatorScreen(age: _age, weight: _weight, height: _height),
            ),
          );
        },
        height: 100,
        child: Text(
          'Calculate',
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
