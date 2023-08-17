import 'package:flutter/material.dart';
import "package:get/get.dart";

import '../../utils/config/uidata.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({required this.imagePath, this.CardText});

  final String imagePath;
  final String? CardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              shadows: [
                BoxShadow(
                  color: Color(0x2B000000),
                  blurRadius: 21,
                  offset: Offset(4, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              width: 36,
              height: Get.width / 9.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ).paddingAll(6),
          ).paddingAll(5),
          Container(
            width: 54,
            child: Text(
              CardText ?? "",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
