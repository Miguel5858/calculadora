// lib/presentation/widgets/result_display.dart

import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double result;
  final bool isDivision;

  ResultDisplay({required this.result, this.isDivision = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 68, 66, 66),
      ),
      child: Text(
        isDivision ? result.toString() : result.toStringAsFixed(0),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }
}
