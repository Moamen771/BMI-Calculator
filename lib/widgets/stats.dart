import 'package:bmi/components/components.dart';
import 'package:flutter/material.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer(
      {super.key,
      required this.name,
      required this.increase,
      required this.decrease,
      required this.stats});

  final String name;
  final int stats;
  final Function() increase;
  final Function() decrease;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              name,
              style: TextStyle(
                  color: thirdColor, fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Text(
              '$stats',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: decrease,
                  icon: const Icon(
                    Icons.remove,
                    size: 35,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: thirdColor,
                    foregroundColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: increase,
                  icon: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: thirdColor,
                    foregroundColor: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
