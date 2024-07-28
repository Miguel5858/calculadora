import 'package:calculadora/presentation/widgets/footer.dart';
import 'package:calculadora/presentation/widgets/operation_input.dart';
import 'package:calculadora/presentation/widgets/operation_selector.dart';
import 'package:calculadora/presentation/widgets/result_display.dart';
import 'package:calculadora/presentation/widgets/number_input.dart';
import 'package:flutter/material.dart';
import '../../data/calculator_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _calculatorService = CalculatorService();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  Operation _selectedOperation = Operation.add;
  double _result = 0.0;

  void _calculate() {
    final firstValue = double.tryParse(_firstController.text) ?? 0.0;
    final secondValue = double.tryParse(_secondController.text) ?? 0.0;

    setState(() {
      switch (_selectedOperation) {
        case Operation.add:
          _result = _calculatorService.add(firstValue, secondValue);
          break;
        case Operation.subtract:
          _result = _calculatorService.subtract(firstValue, secondValue);
          break;
        case Operation.multiply:
          _result = _calculatorService.multiply(firstValue, secondValue);
          break;
        case Operation.divide:
          try {
            _result = _calculatorService.divide(firstValue, secondValue);
          } catch (e) {
            _result = double.nan;
          }
          break;
      }
    });
  }

  void _clear() {
    setState(() {
      _firstController.clear();
      _secondController.clear();
      _result = 0.0;
      _selectedOperation = Operation.add;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ResultDisplay(result: _result),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      controller: _firstController,
                      labelText: 'Primer Número',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: NumberInput(
                      controller: _secondController,
                      labelText: 'Segundo Número',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              OperationInput(
                selectedOperation: _selectedOperation,
                onChanged: (operation) {
                  if (operation != null) {
                    setState(() {
                      _selectedOperation = operation;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _calculate,
                    child: Text('='),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal, // Background color
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _clear,
                    child: Text('CE'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // Background color
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 56),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
