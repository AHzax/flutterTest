import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';

class Listcard extends StatelessWidget {
  final String? rSubtitle;
  final String? title;
  final String? subtitle;
  final String? belowSubtitle;
  final String? rTitle;
  final String? belowRSubtitle;
  final VoidCallback? onPressed;

  const Listcard(
      {this.rSubtitle,
      this.title,
      this.subtitle,
      this.rTitle,
      this.belowSubtitle,
      this.belowRSubtitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Get.height / 8.5,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
          // color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14, color: UIDataColors.DarkGreenColor),
                ),
                Text(
                  "$subtitle",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 12, color: UIDataColors.DarkGreenColor),
                ),
                Text(
                  "$belowSubtitle",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$rTitle",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey),
                ),
                Text(
                  "$rSubtitle",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey),
                ),
                Text(
                  "$belowRSubtitle",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14, color: UIDataColors.DarkGreenColor),
                )
              ],
            )
            // ClipOval(
            //   child: Image.asset(
            //     'assets/images/p.png',
            //     height: 50,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // SizedBox(width: 20,),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       title ?? '',
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: UIDataColors.blackColor,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     Text(
            //       subtitle ?? '',
            //       style: TextStyle(
            //         fontSize: 12,
            //         color: Colors.grey,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // Spacer(),
            // Column(
            //   children: [
            //     status ?? SizedBox(),
            //     status!=null ? SizedBox(height: 10,) : SizedBox(),
            //     Text(
            //       time ?? '',
            //       style: const TextStyle(
            //         fontSize: 10,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ).paddingAll(15),
      ),
    );
  }
}
