import 'package:flutter/material.dart';

enum Operation { add, subtract, multiply, divide }

class OperationSelector extends StatelessWidget {
  final Operation selectedOperation;
  final ValueChanged<Operation?> onChanged;

  OperationSelector({
    required this.selectedOperation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Operation.values.map((operation) {
        return RadioListTile<Operation>(
          title: Text(_operationToString(operation)),
          value: operation,
          groupValue: selectedOperation,
          onChanged: onChanged,
        );
      }).toList(),
    );
  }

  String _operationToString(Operation operation) {
    switch (operation) {
      case Operation.add:
        return 'Suma';
      case Operation.subtract:
        return 'Resta';
      case Operation.multiply:
        return 'Multiplicación';
      case Operation.divide:
        return 'División';
      default:
        return '';
    }
  }
}
