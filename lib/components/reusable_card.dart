import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function()? onUserTap;
  const ReusableCard(
      {super.key, required this.color, this.cardChild, this.onUserTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUserTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(15.0),
        height: 200,
        child: cardChild,
      ),
    );
  }
}
