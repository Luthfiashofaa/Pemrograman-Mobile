import 'package:book/app/modules/home/bindings/home_binding.dart';
import 'package:book/app/modules/homepage/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteStoriesPage extends StatelessWidget {
  final List<String> favoriteFolders = [
    'Cinta',
    'Petualangan',
    'Drama',
    'Komedi',
    'Horror',
    'Fiksi Ilmiah',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folder Cerita Favorit'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to HomePage with index 2
            Get.back(); // Close current page
            Get.find<HomeController>().currentIndex.value =
                2; // Set the index to 2
            Get.toNamed('/home'); // Navigate to HomePage
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddFolderDialog(context);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1,
        ),
        itemCount: favoriteFolders.length,
        itemBuilder: (context, index) {
          return _buildFolderItem(context, favoriteFolders[index]);
        },
      ),
    );
  }

  Widget _buildFolderItem(BuildContext context, String folderName) {
    return Card(
      color: Colors.orange,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoriesInFolderPage(folderName: folderName),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                folderName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Handle edit action
                    },
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Handle delete action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddFolderDialog(BuildContext context) {
    final TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Folder Baru'),
          content: TextField(
            controller: folderNameController,
            decoration: InputDecoration(hintText: 'Nama Folder'),
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                String newFolderName = folderNameController.text;
                if (newFolderName.isNotEmpty) {
                  // Handle adding new folder logic
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class StoriesInFolderPage extends StatelessWidget {
  final String folderName;

  StoriesInFolderPage({required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerita dalam $folderName'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Center(
        child: Text(
          'Daftar cerita dalam folder: $folderName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
