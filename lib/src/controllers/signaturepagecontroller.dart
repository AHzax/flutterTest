import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class SignaturePageController extends GetxController {
  // String scannedDocumentFile = "dummy";
  // TextEditingController title = TextEditingController as TextEditingController;
  Uint8List? exportedSign;

  SignatureController controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportPenColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );
}
