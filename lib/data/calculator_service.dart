// lib/data/calculator_service.dart

class CalculatorService {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Division by zero');
    }
    return a / b;
  }
}
