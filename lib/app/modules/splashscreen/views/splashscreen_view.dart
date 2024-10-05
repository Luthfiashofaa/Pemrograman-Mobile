import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenView extends StatefulWidget {
  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();

    // Navigasi ke halaman berikutnya setelah 8 detik
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed('/login'); // Ganti dengan rute halaman tujuan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Splashscreen.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
