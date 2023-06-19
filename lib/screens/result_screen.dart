import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kActiveCardColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 20),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 80),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onUserTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
