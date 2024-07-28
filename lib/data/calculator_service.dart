class CalculatorService {
  double add(double a, double b) => (a + b).roundToDouble();
  double subtract(double a, double b) => (a - b).roundToDouble();
  double multiply(double a, double b) => (a * b).roundToDouble();
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Division by zero');
    }
    return a / b; // No redondear aquí
  }
}
