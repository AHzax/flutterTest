import 'package:get/get.dart';

import '../controllers/createCustomerController.dart';



class CreateCustomerBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<CreateCustomerController>(() => CreateCustomerController());
  }

}