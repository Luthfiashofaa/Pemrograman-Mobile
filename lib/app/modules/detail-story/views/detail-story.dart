import 'package:book/app/modules/detail-story/views/read-page.dart';
import 'package:book/app/modules/ulasan/views/ulasan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package for navigation

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ibu yang Hebat'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page (HomeView)
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/sampul/mom.jpg',
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ibu yang Hebat',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.edit, size: 16),
                      GestureDetector(
                        onTap: () {
                          Get.to(() =>
                              ReviewsPage()); // Navigate to the Ulasan page
                        },
                        child: Text(
                          ' Anita Ningsih',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.person, size: 16),
                      Text(' 12+'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn('3k', 'Ulasan'),
                      _buildStatColumn('394k', 'Terjemahan'),
                      _buildStatColumn('7 hari', 'Telah Dibaca'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Ikhtisar',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    'Selin Ananta, cewek penuh semangat yang dijadikan objek balas dendam oleh Saga. Cowok itu menduga bahwa Selin berhubungan dengan semua paket hitam yang diterimanya secara misterius selama ini. Paket yang membuat Mamanya terguncang, serta membuatnya membenci sosok Papa. Bagi Saga, Selin adalah sumber masalah. Sebaliknya, bagi Selin, Saga adalah kotanya.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Semakin Saga menyakiti Selin, cewek itu justru tidak gentar mendekatinya. Siapa sangka rupanya Selin hadir di hidupnya dengan membawa misi penting.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Add "Baca Selengkapnya" button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ReadPage());
                      },
                      child: Text(
                        'Baca Selengkapnya',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            if (label == 'Ulasan') {
              Get.to(() => ReviewsPage()); // Navigate to the Ulasan page
            }
          },
          child: Text(label,
              style: TextStyle(
                  color: Colors.grey, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
