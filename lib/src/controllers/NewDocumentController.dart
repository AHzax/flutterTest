import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mime/mime.dart';

import '../utils/routes/app_routes.dart';

class NewDocumentController extends GetxController {
  TextEditingController title = TextEditingController();
  PDFDocument? scannedDocument;
  File? scannedDocumentFile;
  String pathPdf = "";
  late List<FileSystemEntity> docList;
  bool isLoading = true;
  Directory? docDir;
  String? mimeName;
  String? file;
  bool value = false;

  @override
  onInit() async {
    docDir = await getExternalStorageDirectory();
    docList = await docDir!.list().toList();
    super.onInit();
  }

  @override
  onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  // openPdfScanner(context) async {
  //   var doc = await DocumentScannerFlutter.launchForPdf(context);
  //   if (doc != null) {
  //     scannedDocument = null;

  //     await Future.delayed(Duration(milliseconds: 100));
  //     scannedDocumentFile = doc;
  //     scannedDocument = await PDFDocument.fromFile(doc);
  //     update();
  //   }
  //   pathPdf = '';
  // }

////////////////////////////////////////

  Future<void> getImageFromCamera() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      //Make sure to await the call to detectEdge.
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      print("success: $success");
    } catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    

  
  }

  //////////////////////////////////////////

  Future writepdf(File? data) async {
    PermissionStatus status = await Permission.storage.status;
    PermissionStatus nStatus;

    if (!status.isGranted) {
      nStatus = await Permission.storage.request();
      if (nStatus != PermissionStatus.granted) {
        print('permissions not allowed');
      }
    }

    print(docDir?.path ?? 'no directory');

    print("okie okie okie #####: ${docList.toList()}");

    File docPath = File('${docDir!.path}/${title.text}.pdf');

    print("okie okie okie #####: ${docPath}");

    Uint8List b = await data!.readAsBytes();
    await docPath.writeAsBytes(b);

    pathPdf = docPath.path;
    docList = await docDir!.list().toList();
    update();
    Get.offAndToNamed(Routes.homeRoute);
    // pathPdf = '';
  }

  String getFileName(String? path) {
    String filename = '';
    if (path != null) {
      print('--- ${docDir?.path}');
      filename = path.replaceFirst(RegExp('${docDir?.path}/'), '');
    } else {
      filename = '';
    }
    return filename;
  }

  String getMimeType(String? path) {
    String mime = lookupMimeType('${docDir?.path}/$path') ?? '';
    mimeName = mime.replaceFirst(RegExp('application/'), '');

    return '$mimeName doc';
  }

  listTap(int i) {
    Get.toNamed(Routes.PdfViewRoute);
    file = docList[i].path;
  }
}
