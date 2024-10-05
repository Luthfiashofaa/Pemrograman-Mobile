import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package for navigation

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];
  int? _editingIndex;

  void _submitComment() {
    if (_commentController.text.isNotEmpty) {
      if (_editingIndex != null) {
        setState(() {
          _comments[_editingIndex!] =
              _commentController.text; // Update existing comment
          _editingIndex = null; // Reset editing index
        });
      } else {
        setState(() {
          _comments.add(_commentController.text); // Add new comment
        });
      }
      _commentController.clear(); // Clear the text field after submission
      Get.snackbar("Success", "Comment submitted!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _editComment(int index) {
    setState(() {
      _editingIndex = index; // Set index for editing
      _commentController.text =
          _comments[index]; // Populate text field with existing comment
    });
  }

  void _deleteComment(int index) {
    setState(() {
      _comments.removeAt(index); // Remove comment from list
    });
    Get.snackbar("Deleted", "Comment deleted!",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komentar'), // Title for the Comment Page
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Tulis komentar Anda',
                border: OutlineInputBorder(),
                hintText: 'Masukkan komentar...',
              ),
              maxLines: 4, // Allow multi-line comments
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _submitComment,
                child: Text(_editingIndex != null
                    ? 'Update Komentar'
                    : 'Kirim Komentar'),
              ),
            ),
            SizedBox(height: 16),
            Text('Komentar:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: _comments.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _comments[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () =>
                                  _editComment(index), // Edit comment
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () =>
                                  _deleteComment(index), // Delete comment
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
