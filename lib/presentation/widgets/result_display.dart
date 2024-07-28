import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double result;

  ResultDisplay({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Text(
          result.toString(),
          style: TextStyle(
            fontSize: 48,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
            fontFamily: 'Courier',
          ),
        ),
      ),
    );
  }
}
