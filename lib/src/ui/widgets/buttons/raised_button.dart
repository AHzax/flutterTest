import 'package:flutter/material.dart';

import '../../../utils/config/uidata.dart';
// import 'package:get/get.dart';


// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  Function()? onPressed;
  String label;
  double buttonCurve;
  double? elevation;
  Color? textcolor;
  Color? color;

  ReusableButton({
    required this.onPressed,
    required this.label,
    required this.buttonCurve,
    this.elevation,
    this.textcolor = UIDataColors.kWhiteButtonColor,
    this.color = UIDataColors.kBlueButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // padding: EdgeInsets.all(12.0),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(buttonCurve),
          ),
        ), primary: color ?? UIDataColors.kBlueButtonColor,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Futurahi',
          fontWeight: FontWeight.w400,
          color: textcolor ?? UIDataColors.kWhiteButtonColor,
        ),
      ),
    );
  }
}
