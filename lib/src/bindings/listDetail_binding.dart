import 'package:get/get.dart';

import '../controllers/listDetail_controller.dart';

class ListDetailBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<ListDetailController>(() => ListDetailController());
  }

}