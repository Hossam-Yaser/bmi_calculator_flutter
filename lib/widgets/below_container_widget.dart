import 'package:flutter/material.dart';
import 'package:bmi/screens/start_screen.dart';

class BelowContainerWidget extends StatefulWidget {
  const BelowContainerWidget({
    super.key,
    this.mainText = 'Weight',
    this.indicatorValue = 60,
    this.widgetColor = backgroundColor,
    this.onValueChanged,
  });

  final String mainText;
  final int widgetColor;
  final int indicatorValue;
  final ValueChanged<int>? onValueChanged;

  @override
  State<BelowContainerWidget> createState() => _BelowContainerWidgetState();
}

class _BelowContainerWidgetState extends State<BelowContainerWidget> {
  late int _indicatorValue;

  @override
  void initState() {
    super.initState();
    _indicatorValue = widget.indicatorValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 180,
        width: 155,
        decoration: BoxDecoration(
          color: Color(widget.widgetColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              widget.mainText,
              style: TextStyle(color: Color(textColor), fontSize: 20),
            ),
            Text(
              '$_indicatorValue',
              style: TextStyle(color: Color(mainColor), fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/minusSign.png'),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      if (_indicatorValue > 1 && _indicatorValue <= 250) {
                        _indicatorValue--;
                        widget.onValueChanged?.call(_indicatorValue);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/addSign.png'),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      if (_indicatorValue >= 1 && _indicatorValue < 250) {
                        _indicatorValue++;
                        widget.onValueChanged?.call(_indicatorValue);
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
