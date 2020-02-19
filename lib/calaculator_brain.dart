import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
  });

  final int height;
  final int weight;
  double _bmi;

  String getBMIResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultState() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than the normal. Try exercise more!. ';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job.';
    } else {
      return 'Your body weight is lower than the normal. You can eat a bit more!.';
    }
  }
}
