import 'package:book/app/modules/homepage/views/home_view.dart';
import 'package:book/app/modules/write-story/views/write-story_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  var currentIndex = 2.obs; // Default pada home

  void changePage(int index) {
    currentIndex.value = index; // Update currentIndex
  }
}
