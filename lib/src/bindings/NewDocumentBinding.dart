import 'package:get/get.dart';

import '../controllers/NewDocumentController.dart';

class NewDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewDocumentController>(() => NewDocumentController());
  }
}
