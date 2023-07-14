import 'package:flutter/material.dart';
import "package:get/get.dart";

import '../../utils/config/uidata.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.height,
    this.width,
    required this.icon,
    required this.valueText,
    required this.statusText,
    this.fontSize,
    required this.color,
  });

  final double? height;
  final double? width;
  final Icon icon;
  final String valueText;
  final String statusText;
  final double? fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.width / 2.2,
      width: width ?? Get.width / 2.9,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: color,
          // ),
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (width ?? Get.width / 2.4) / 5,
              width: (width ?? Get.width / 2.4) / 5,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(90),
                // border: Border.all(color: Colors.white.withAlpha(30)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              child: icon,
            ),
            SizedBox(
              height: (width ?? Get.width / 2.4) / 5,
            ),
            Text(
              valueText,
              // valueText,
              // "12",
              style: TextStyle(
                fontSize: fontSize ?? 24,
                color: UIDataColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              statusText,
              // "In Progres \nProject",
              style: const TextStyle(
                color: UIDataColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              textScaleFactor: 1,
            ),
          ],
        ).marginOnly(
            right: 10,
            left: 10,
            top: Get.height * 0.02,
            bottom: Get.height * 0.02),
      ),
    );
  }
}
