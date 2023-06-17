import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Function() onUserPressed;
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onUserPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onUserPressed,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      elevation: 10,

      //to assign the size of the icon
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      child: icon,
    );
  }
}
