import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mime/mime.dart';
import '../utils/routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image/image.dart' as img;

class NewDocumentController extends GetxController {
  var pdf;
  pw.MemoryImage? pdfImage;
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
  Rx<File?> image = Rx<File?>(null);
  File? gridImage;
  List<File> images = [];

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
  ///////////////////////////////////////

  /////////////////////////converting//////////////

  Future<String> convertImagesToPdf(List<File> imageFiles) async {
    pdf = pw.Document();
    for (final imageFile in imageFiles) {
      final bytes = await imageFile.readAsBytes();
      final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
      pdfImage = pw.MemoryImage(Uint8List.fromList(img.encodePng(image)));
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(pdfImage!),
            );
          },
        ),
      );
    }
    final DocDir = await getApplicationDocumentsDirectory();
    final pdfPath = '${DocDir.path}/output.pdf';
    final File pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(Uint8List.fromList(await pdf.save()));
    pathPdf = pdfPath;
    // loading = false.obs;
    // Get.toNamed(Routes.PdfViewRoute);
    // Get.log('Converted');
    update();
    Get.back();

    return pdfPath;
  }

  Future<void> deleteSelect(int index) async {
    images.removeAt(index);
    update();
  }

  ////////////////picking image////////////
  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
      gridImage = image.value;
      Get.log(image.toString());
      images.add(gridImage!);
      print(images);
      update();
    }
  }

  ///////////dialog////////////////////////
  Future<void> showImagePickerDialog() async {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Pick an Image',
          style: TextStyle(
            fontFamily: 'font',
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text(
                  'Camera',
                ),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                child: Text(
                  'Gallery',
                ),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

////////////////////////////////////////

  // Future<void> getImageFromCamera() async {
  //   bool isCameraGranted = await Permission.camera.request().isGranted;
  //   if (!isCameraGranted) {
  //     isCameraGranted =
  //         await Permission.camera.request() == PermissionStatus.granted;
  //   }

  //   if (!isCameraGranted) {
  //     // Have not permission to camera
  //     return;
  //   }

  //   // Generate filepath for saving
  //   String imagePath = join((await getApplicationSupportDirectory()).path,
  //       "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

  //   try {
  //     //Make sure to await the call to detectEdge.
  //     // bool success = await EdgeDetection.detectEdge(
  //     //   imagePath,
  //     //   canUseGallery: true,
  //     //   androidScanTitle: 'Scanning', // use custom localizations for android
  //     //   androidCropTitle: 'Crop',
  //     //   androidCropBlackWhiteTitle: 'Black White',
  //     //   androidCropReset: 'Reset',
  //     // );
  //     // print("success: $success");
  //   } catch (e) {
  //     print(e);
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.

  // }

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
    Get.toNamed(Routes.docListPage);
    pathPdf = '';
    pdfImage = null;
    images.clear();
    title.clear();
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
