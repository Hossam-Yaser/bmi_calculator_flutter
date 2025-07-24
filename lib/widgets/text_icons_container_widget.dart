import 'package:flutter/material.dart';
import 'package:bmi/screens/start_screen.dart';

class TextIconsContainerWidget extends StatelessWidget {
  final int containerBackgroundColor;
  final String imagePath;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const TextIconsContainerWidget({
    super.key,
    this.containerBackgroundColor = backgroundColor,
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
          height: 155,
          width: 180,
          decoration: BoxDecoration(
            color: Color(isSelected ? backgroundColor : secondIconColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 70),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(color: Color(mainColor), fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
