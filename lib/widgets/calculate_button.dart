import 'package:bmi/components/components.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key, required this.onTap, required this.name});

  final Function() onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: primary,
      minWidth: double.infinity,
      height: 60,
      child: Text(
        name,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
