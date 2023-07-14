import 'package:flutter/material.dart';

class ReusableIconButton extends StatelessWidget {
  final Icon icon;
  final Function()? onPressed;
  ReusableIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,

    );
  }
}
