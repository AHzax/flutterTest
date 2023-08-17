import 'package:get/get.dart';

import '../controllers/createProjectController.dart';


class CreateProjectBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectController>(() => CreateProjectController());
  }

}