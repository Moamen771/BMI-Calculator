import 'package:bmi/components/components.dart';
import 'package:bmi/widgets/calculate_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final double result;

  String get healthiness {
    String healthinessString;
    if (result < 18.5) {
      healthinessString = 'Underweight';
    } else if (result <= 24.9) {
      healthinessString = 'Normal';
    } else if (result <= 29.9) {
      healthinessString = 'Overweight';
    } else if (result <= 34.9) {
      healthinessString = 'Obese';
    } else {
      healthinessString = 'Extremely Obese';
    }
    return healthinessString;
  }

  double get roundedResult {
    return (result * 10).round() / 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "Your Result",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .60,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  healthiness,
                  style: const TextStyle(
                      fontSize: 32,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    "$roundedResult",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 100),
                  ),
                ),
                Text(
                  "You have a $healthiness body weight",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Spacer(),
          CalculateButton(
              onTap: () {
                Navigator.pop(context);
              },
              name: "Re-Calculate"),
        ],
      ),
    );
  }
}
