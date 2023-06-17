import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function() onUserTap;
  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUserTap,
      child: Container(
        decoration: BoxDecoration(
          color: kBottomButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: kBottomButtonHeight,
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
