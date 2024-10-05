// ignore_for_file: use_key_in_widget_constructors
import 'package:book/app/modules/create-view/views/create-story.dart';
import 'package:book/app/modules/detail-story/views/read-page.dart';
import 'package:book/app/modules/homepage/views/home_view.dart';
import 'package:book/app/modules/login/views/login_view.dart';
import 'package:book/app/modules/profile/views/profileView.dart';
import 'package:book/app/modules/write-story/bindings/write_binding.dart';
import 'package:book/app/modules/write-story/views/write-story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/splashscreen/views/splashscreen_view.dart';

void main() {
  // Memastikan RecipeController terinisialisasi
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      initialRoute: '/splashscreen',
      getPages: [
        GetPage(name: '/splashscreen', page: () => SplashscreenView()),
        GetPage(name: '/homepage', page: () => HomeView()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(
          name: '/create-story',
          page: () => CreatStoryView(),
        ),
        GetPage(
          name: '/write-story',
          page: () => WriteStoryView(),
          binding: WriteBinding(),
        ),
        GetPage(
          name: '/profil-view',
          page: () => ProfileView(),
        ),
        GetPage(
          name: '/read-view',
          page: () => ReadPage(),
        ),
      ],
    );
  }
}
