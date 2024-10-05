import 'package:get/get.dart';

class WriteController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  var currentIndex = 3.obs; // Default pada home

  void changePage(int index) {
    currentIndex.value = index; // Update currentIndex
  }
}
