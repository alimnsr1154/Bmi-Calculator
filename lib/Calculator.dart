import 'dart:math';

class Calculator {
  Calculator({required this.he_ight, required this.we_ight});

  late int he_ight;
  late int we_ight;
  double _bmi = 0.0;

  String Calculate() {
    _bmi = we_ight / pow(he_ight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Result() {
    print(_bmi);
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String Interpretation() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight, Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal bdy weight.Good job';
    } else {
      return 'You have a lower than normal body weight.You can eat a bit more';
    }
  }
}
