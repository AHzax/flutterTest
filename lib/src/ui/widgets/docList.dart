import 'dart:io';

import 'package:docapp/src/ui/widgets/common_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/config/uidata.dart';

class CustomDoclistWidget extends StatelessWidget {
  // final String getFileName;
  // void listTap(int i);
  // VoidCallback listTap( int i);
  // String getFileName(String? path);

  // String getMimeType(String? path);

  List<FileSystemEntity> docList;
  void Function(int i) listTap;
  String Function(String path) getFileName;
  String Function(String path) getMimeType;

  CustomDoclistWidget({
    // required this.getFileName,

    required this.docList,
    required this.getFileName,
    required this.getMimeType,
    required this.listTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: docList.length,
        itemBuilder: (BuildContext context, int i) {
          // return SizedBox();
          // FileSystemEntity? file = object.data;
          FileSystemEntity file = docList[i];
          return Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade800
                : Colors.grey[300],
            child: ListTile(
              leading: Icon(
                Icons.insert_drive_file_outlined,
                color: UIDataColors.commonColor,
                size: 48,
              ),
              onTap: () {
                listTap(i);
              },
              title: Text(
                getFileName(file.path),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                getMimeType(file.path),
                style: TextStyle(fontSize: 12),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    color: UIDataColors.commonColor,
                  )),
            ),
          ).paddingOnly(top: Get.height * 0.02);
        },
      ).paddingOnly(
        left: 20,
        right: 20,
      ),
    );
  }
}
