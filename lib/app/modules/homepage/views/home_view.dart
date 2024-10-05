import 'package:book/app/modules/detail-story/views/detail-story.dart';
import 'package:book/app/modules/favorite/views/favorite-view.dart';
import 'package:book/app/modules/profile/views/profileView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import curved navigation bar package

import '../controllers/home_controller.dart';
import 'itemcards.dart';
import 'package:book/app/modules/write-story/views/Write-Story_view.dart';

class HomeView extends StatelessWidget {
  // Inisialisasi controller
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    double headerHeight;
    double headerWidth;
    if (screenWidth > 600) {
      headerHeight = screenHeight * 0.27;
      headerWidth = screenWidth * 0.5;
    } else {
      headerHeight = screenHeight * 0.25;
      headerWidth = screenWidth * 1;
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: headerHeight,
                width: headerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/header.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage()); // Navigate to BookDetailsPage
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/mom.jpg',
                      text1: 'Ibu yang Hebat',
                      text2: 'Anita Ningsih',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/pahlawan.jpg',
                      text1: 'Pahlawan Terakhir',
                      text2: 'Arif Budiman',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/pujangga.jpg',
                      text1: 'Pujangga Abadi',
                      text2: 'Rendra Prasetyo',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/legenda.jpg',
                      text1: 'Kisah Legenda',
                      text2: 'Kalki Krishnamurthy',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/raja.jpg',
                      text1: 'Raja yang Bijak',
                      text2: 'Sutomo',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/ayah.jpg',
                      text1: 'Ayah Kaya, Ayah Miskin',
                      text2: 'Robert Kiyosaki',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/cinta.jpg',
                      text1: 'Cinta dan Kehidupan',
                      text2: 'Poomani',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/wings.jpg',
                      text1: 'Sayap Api',
                      text2: 'Dr. Abdul Kalam',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/money.jpg',
                      text1: 'Psikologi Uang',
                      text2: 'Morgan Housel',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/bts.jpg',
                      text1: 'Tentang BTS',
                      text2: 'Army',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/jatuh.jpg',
                      text1: 'Kejatuhan',
                      text2: 'Ryan & Albert',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/heart.jpg',
                      text1: 'Hati yang Bahagia',
                      text2: 'Dalai Lama',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/habit.jpg',
                      text1: 'Kekuatan Kebiasaan',
                      text2: 'Charles Duhigg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/thinking.jpg',
                      text1: 'Seni Berpikir',
                      text2: 'Mark Swartz',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BookDetailsPage());
                    },
                    child: ItemCards(
                      imagepic: 'assets/sampul/art.jpg',
                      text1: 'Seni yang Halus',
                      text2: 'Mark Manson',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      // CurvedNavigationBar di bagian bawah
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            index: controller.currentIndex.value,
            items: <Widget>[
              Image.asset('assets/search.png', width: 40, height: 40),
              Image.asset('assets/heart.png', width: 40, height: 40),
              Image.asset('assets/home.png', width: 40, height: 40),
              Image.asset('assets/pencil.png', width: 40, height: 40),
              Image.asset('assets/user.png', width: 40, height: 40),
            ],
            backgroundColor: Colors.transparent,
            color: Color(0xFFEE671E),
            buttonBackgroundColor: Color(0xFFEE671E),
            onTap: (index) {
              if (controller.currentIndex.value != index) {
                controller.changePage(index);
                switch (index) {
                  case 0:
                    // Navigasi ke halaman pencarian
                    break;
                  case 1:
                    Get.to(FavoriteStoriesPage());
                    break;
                  case 2:
                    Get.to(HomeView());
                    // Tidak perlu melakukan apa-apa, sudah di Home
                    break;
                  case 3:
                    Get.to(WriteStoryView());
                    break;
                  case 4:
                    Get.to(ProfileView());
                    break;
                }
              }
            },
          )),
    );
  }
}
