import 'package:book/app/modules/homepage/views/home_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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

  void login() {
    // Logic for login (e.g., validate credentials)
    // For now, we'll just navigate to the HomePage
    Get.offAll(() => HomeView()); // This will navigate to the HomePage
  }
}
