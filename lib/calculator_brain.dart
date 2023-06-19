import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  //this is to pass the value of this into another file
  //to able able to pass value to ther page
  CalculatorBrain({required this.height, required this.weight});

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'To achieve a healthier weight, focus on consuming a balanced diet and increasing physical activity. This can be done by reducing portion sizes, choosing nutrient-dense foods, and limiting processed or sugary items. ';
    } else if (_bmi > 18.5) {
      return 'Weight is generally healthy for your height. However, maintaining a healthy lifestyle is still important. Focus on maintaining a balanced diet, engaging in regular physical activity, and practicing good overall self-care.';
    } else {
      return 'May suggest increasing caloric intake through a well-balanced diet, incorporating strength training exercises to build muscle mass, and addressing any potential medical conditions.';
    }
  }
}
