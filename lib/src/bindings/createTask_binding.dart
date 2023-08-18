import 'package:get/get.dart';

import '../controllers/createTaskController.dart';



class CreateTaskBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(() => CreateTaskController());
  }

}