import 'package:get/get.dart';

import '../controllers/signaturepagecontroller.dart';

class SignaturePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignaturePageController>(() => SignaturePageController());
  }
}
