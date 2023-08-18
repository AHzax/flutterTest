import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';
// import 'package:get/get.dart';

// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  Function()? onPressed;
  String label;
  double? fontsize;

  double buttonCurve;
  double? elevation;
  EdgeInsetsGeometry? padding;
  bool showBorder;
  Color? textcolor;
  Color? color;

  ReusableButton({
    required this.onPressed,
    required this.label,
    required this.buttonCurve,
    required this.showBorder,
    this.elevation,
    this.padding,
    this.fontsize,
    this.textcolor = UIDataColors.kWhiteButtonColor,
    this.color = UIDataColors.kBlueButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // padding: EdgeInsets.all(12.0),
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(buttonCurve),
          ),
          side: showBorder
              ? BorderSide(
                  width: 1,
                  color: UIDataColors.DarkGreenColor,
                )
              : BorderSide.none,
        ),
        primary: color ?? UIDataColors.kBlueButtonColor,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontsize,
          fontFamily: 'inter',
          fontWeight: FontWeight.w400,
          color: textcolor ?? UIDataColors.kWhiteButtonColor,
        ),
      ),
    );
  }
}
