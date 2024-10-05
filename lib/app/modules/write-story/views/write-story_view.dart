import 'package:book/app/modules/create-view/views/create-story.dart';
import 'package:book/app/modules/home/bindings/home_binding.dart';
import 'package:book/app/modules/homepage/controllers/home_controller.dart';
import 'package:book/app/modules/homepage/views/home_view.dart';
import 'package:book/app/modules/profile/views/profileView.dart';
import 'package:book/app/modules/write-story/bindings/write_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteStoryView extends StatefulWidget {
  @override
  _WriteStoryViewState createState() => _WriteStoryViewState();
}

class _WriteStoryViewState extends State<WriteStoryView> {
  String? title;
  String? description;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Cerita'),
        backgroundColor: Color(0xFFEE671E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to HomeView with index 2
            controller.currentIndex.value = 2; // Set index to 2
            Get.to(() => HomeView(), binding: HomeBinding());
          },
        ),
      ),
      body: Stack(
        children: [
          // Cover Story
          _buildStoryCover(),
          Positioned(
            top: 600, // Adjust the position from the top as needed
            right: 20,
            child: GestureDetector(
              onTap: () async {
                final result = await Get.to(() => CreatStoryView());

                if (result != null) {
                  setState(() {
                    title = result['title'];
                    description = result['description'];
                    imagePath = result['imagePath'];
                  });
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(
                    'assets/pencil.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          // Delete Icon Positioned Near Story Details
        ],
      ),
    );
  }

  Widget _buildStoryCover() {
    // Sample story data
    if (title == null && description == null && imagePath == null) {
      title = "Cinta Sejati";
      description =
          "Sebuah kisah tentang cinta yang tak terduga dan penuh perjuangan.";
      imagePath =
          'assets/cinta-sejati.jpg'; // Update with your actual image path
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title ?? '',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          // Clear the story data
                          setState(() {
                            title = null;
                            description = null;
                            imagePath = null;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    description ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
