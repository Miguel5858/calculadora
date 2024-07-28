import 'package:flutter/material.dart';
import 'package:calculadora/presentation/widgets/operation_selector.dart';

class OperationInput extends StatelessWidget {
  final Operation selectedOperation;
  final ValueChanged<Operation?> onChanged;

  OperationInput({required this.selectedOperation, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return OperationSelector(
      selectedOperation: selectedOperation,
      onChanged: onChanged,
    );
  }
}
