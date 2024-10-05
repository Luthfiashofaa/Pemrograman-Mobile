import 'package:book/app/modules/homepage/controllers/home_controller.dart';
import 'package:book/app/modules/write-story/views/write-story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatStoryView extends StatefulWidget {
  @override
  _CreatStoryViewState createState() => _CreatStoryViewState();
}

class _CreatStoryViewState extends State<CreatStoryView> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Cerita'),
        backgroundColor: Color(0xFFEE671E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(() => WriteStoryView(), binding: BindingsBuilder(() {
              HomeController homeController = Get.put(HomeController());
              homeController.currentIndex.value =
                  3; // Set the index to 3 (pencil icon)
            }));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _imageFile == null
                      ? Center(
                          child: Text('Masukkan gambar sampul',
                              style: TextStyle(color: Colors.grey)),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Judul Cerita',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Cerita',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print("Button pressed"); // Debugging line
                  // Validate input
                  if (_imageFile == null) {
                    Get.snackbar("Error", "Please select an image.",
                        snackPosition: SnackPosition.BOTTOM);
                    return;
                  }
                  if (_titleController.text.isEmpty ||
                      _descriptionController.text.isEmpty) {
                    Get.snackbar("Error", "All fields are required.",
                        snackPosition: SnackPosition.BOTTOM);
                    return;
                  }

                  // Pass the form data to the previous page
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  String imagePath = _imageFile!.path;

                  // Instead of navigating to a new page, just go back
                  Get.back(result: {
                    'title': title,
                    'description': description,
                    'imagePath': imagePath,
                  });
                },
                child: Text('Simpan Cerita'),
                style: ElevatedButton.styleFrom(primary: Color(0xFFEE671E)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
