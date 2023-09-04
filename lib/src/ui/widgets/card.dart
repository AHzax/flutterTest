import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../utils/config/uidata.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    this.height,
    this.width,
    this.onPressed,
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
  Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height ?? Get.width / 2.2,
        width: width ?? Get.width / 2.9,
        child: Card(
          shadowColor: Color.fromARGB(206, 0, 0, 0),
          elevation: 7,
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
                  color: Theme.of(context).brightness == Brightness.dark
                          ? UIDataColors.whiteColor
                          : Colors.black,
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
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                          ? UIDataColors.whiteColor
                          : Colors.black,
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
      ),
    );
  }
}
