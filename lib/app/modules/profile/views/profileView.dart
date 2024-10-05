import 'package:book/app/modules/homepage/views/home_view.dart';
import 'package:book/app/modules/profile/controllers/profile_controller.dart';
import 'package:book/app/modules/profile/views/description_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:book/app/modules/homepage/controllers/home_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Set the index to 2 before navigating back to HomeView
            HomeController homeController = Get.find<HomeController>();
            homeController.currentIndex.value = 2; // Set the index
            Get.off(() => HomeView()); // Navigate to HomeView
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    controller.isHariRaya()
                        ? _buildProfileWithBorder()
                        : _buildProfileWithoutBorder(),
                    SizedBox(height: 16),
                    Text(
                      'Fadlan Fasya',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCountItem(
                            'FOLLOWING LIST', controller.followingCount),
                        _buildCountItem('WORK', controller.workCount),
                        _buildCountItem('FOLLOWERS', controller.followersCount),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description about yourself',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the DescriptionFormPage
                      Get.to(() => DescriptionFormPage());
                    },
                    child: Text('Add/Edit Description'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Stories by @fadlanfasya'),
                  SizedBox(height: 8),
                  _buildStoryItem('Covers', '1 published story'),
                  SizedBox(height: 8),
                  _buildStoryItem('Covers', '1 published story'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWithoutBorder() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage('https://example.com/profile-image.jpg'),
    );
  }

  Widget _buildProfileWithBorder() {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.green,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage('https://example.com/profile-image.jpg'),
      ),
    );
  }

  Widget _buildCountItem(String label, RxInt count) {
    return Column(
      children: [
        Obx(() => Text(
              count.toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildStoryItem(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
