import 'package:flutter/material.dart';
import "package:get/get.dart";

class LogoCard extends StatelessWidget {
  const LogoCard(
      {required this.imagePath, this.CardText, required this.onPressed});
  final VoidCallback onPressed;
  final String imagePath;
  final String? CardText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Get.width * 0.013),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              shadows: const [
                BoxShadow(
                  color: Color(0x2B000000),
                  blurRadius: 21,
                  offset: Offset(4, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              width: Get.width / 9.8,
              height: Get.width / 9.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ).paddingAll(6),
          ),
          Container(
            width: Get.width / 7.3,
            child: Text(
              CardText ?? "",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
