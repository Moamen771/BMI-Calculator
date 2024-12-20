import 'dart:math';
import 'package:bmi/components/components.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/widgets/calculate_button.dart';
import 'package:bmi/widgets/gender_container.dart';
import 'package:bmi/widgets/stats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 170;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GenderContainer(
                    name: "Male",
                    onTap: () {
                      setState(() {
                        isMale = true;
                        isMale ? true : false;
                      });
                    },
                    isMale: isMale),
                GenderContainer(
                    name: "Female",
                    onTap: () {
                      setState(() {
                        isMale = false;
                        isMale ? false : true;
                      });
                    },
                    isMale: isMale),
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: thirdColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${height.round()}',
                      style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Cm',
                      style: TextStyle(
                          fontSize: 20,
                          color: thirdColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Slider(
                  value: height,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                  min: 80,
                  max: 250,
                  activeColor: primary,
                  inactiveColor: thirdColor,
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                StatsContainer(
                    name: "Weight",
                    stats: weight,
                    increase: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decrease: () {
                      setState(() {
                        if (weight > 0) {
                          weight--;
                        }
                      });
                    }),
                StatsContainer(
                    name: "Age",
                    increase: () {
                      setState(() {
                        age++;
                      });
                    },
                    decrease: () {
                      setState(() {
                        if (age > 0) {
                          age--;
                        }
                      });
                    },
                    stats: age)
              ],
            ),
          ),
          CalculateButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      result: weight / pow(height / 100, 2),
                    ),
                  ));
            },
            name: "Calculate",
          ),
        ],
      ),
    );
  }
}
