import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCardContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardTitle;
  const ReusableCardContent({
    super.key,
    required this.cardIcon,
    required this.cardTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          color: const Color(0xFF8D8E98),
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          cardTitle,
          style: kCardTitleTextStyle,
        ),
      ],
    );
  }
}
