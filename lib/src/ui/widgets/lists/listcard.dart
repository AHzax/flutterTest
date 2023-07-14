
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';

class Listcard extends StatelessWidget {
  final String? time;
  final String? title;
  final String? subtitle;
  final Widget? status;
  const Listcard({
    this.time,
    this.title,
    this.subtitle,
    this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        color: UIDataColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/p.png',
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: UIDataColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  subtitle ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                status ?? SizedBox(),
                status!=null ? SizedBox(height: 10,) : SizedBox(),
                Text(
                  time ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
