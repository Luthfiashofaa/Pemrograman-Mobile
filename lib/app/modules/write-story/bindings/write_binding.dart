import 'package:get/get.dart';

import '../controllers/write_controller.dart';

class WriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteController>(() => WriteController());
  }
}
