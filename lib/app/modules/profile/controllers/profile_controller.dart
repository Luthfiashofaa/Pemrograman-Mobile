import 'package:get/get.dart';

class ProfileController extends GetxController {
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

  final RxInt followingCount = 2.obs;
  final RxInt workCount = 1.obs;
  final RxInt followersCount = 0.obs;

  // Misal kita tentukan apakah sekarang adalah Idul Fitri
  bool isHariRaya() {
    DateTime today = DateTime.now();
    // Sesuaikan dengan tanggal Idul Fitri yang berlaku
    DateTime idulFitri =
        DateTime(today.year, 4, 10); // Contoh tanggal Idul Fitri 10 April 2024
    return today.isAtSameMomentAs(idulFitri);
  }
}
