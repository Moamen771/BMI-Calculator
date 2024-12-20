import 'package:bmi/components/components.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer(
      {super.key,
      required this.name,
      required this.onTap,
      required this.isMale});

  final String name;
  final bool isMale;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (isMale && name == 'Male') || (!isMale && name == 'Female')
                ? secondaryColor
                : darkColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                name == 'Male' ? Icons.male : Icons.female,
                size: 100,
                color: Colors.white,
              ),
              Text(
                name,
                style: TextStyle(
                    color: thirdColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
