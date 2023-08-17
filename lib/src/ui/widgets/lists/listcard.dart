// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';

class Listcard extends StatelessWidget {
  final String? time;
  final String? title;
  final String? subtitle;
  final String? owner;
  final String? date;
  final String? type;
  

  final Widget? status;
  const Listcard(
      {this.time, this.title, this.subtitle, this.status, this.owner, this.date, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                textAlign: TextAlign.start,
                style:
                    TextStyle(fontSize: 14, color: UIDataColors.DarkGreenColor),
              ),
              Text(
                "$subtitle",
                textAlign: TextAlign.start,
                style:
                    TextStyle(fontSize: 14, color: UIDataColors.DarkGreenColor),
              ),
              Text(
                "$owner",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$date",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "$time",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "$type",
                textAlign: TextAlign.start,
                style:
                    TextStyle(fontSize: 14, color: UIDataColors.DarkGreenColor),
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
    );
  }
}
