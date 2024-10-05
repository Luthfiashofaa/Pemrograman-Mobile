import 'package:flutter/material.dart';

import 'package:get/get.dart'; // Import Get package for navigation

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Jefri Akbar',
      'date': 'SEPT 25, 2023',
      'comment': 'Alur ceritanya bagus',
      'likes': 60,
    },
    {
      'name': 'Maria Ulan',
      'date': 'SEPT 26, 2023',
      'comment': 'Sangat menarik dan menginspirasi!',
      'likes': 30,
    },
    {
      'name': 'Budi Raharjo',
      'date': 'SEPT 27, 2023',
      'comment': 'Cerita yang menarik dan karakter yang kuat.',
      'likes': 45,
    },
    {
      'name': 'Komentar Anda',
      'date': 'SEPT 28, 2023',
      'comment': 'Saya tidak bisa berhenti membaca!',
      'likes': 75,
    },
    {
      'name': 'Andi Yudho',
      'date': 'SEPT 29, 2023',
      'comment': 'Penulisan yang sangat baik dan detail.',
      'likes': 50,
    },
  ];

  final TextEditingController _reviewController = TextEditingController();
  int? _editingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3k Ulasan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return _buildReviewItem(reviews[index], index);
              },
            ),
          ),
          _buildAddReviewSection(),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/50'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(review['date'], style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star, color: Colors.orange),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(review['comment']),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.thumb_up, size: 16),
              SizedBox(width: 4),
              Text('${review['likes']}'),
              SizedBox(width: 16),
              // Show edit and delete icons if the review is "Komentar Anda"
              if (review['name'] == 'Komentar Anda')
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _editReview(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteReview(index);
                      },
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAddReviewSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tulis Ulasan:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            controller: _reviewController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Tulis ulasan cerita di sini...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              _submitReview();
            },
            child:
                Text(_editingIndex != null ? 'Update Ulasan' : 'Kirim Ulasan'),
          ),
        ],
      ),
    );
  }

  void _submitReview() {
    if (_reviewController.text.isNotEmpty) {
      if (_editingIndex != null) {
        // Update existing review
        setState(() {
          reviews[_editingIndex!]['comment'] = _reviewController.text;
          _editingIndex = null; // Reset editing index
        });
      } else {
        // Add new review
        setState(() {
          reviews.add({
            'name': 'Komentar Anda',
            'date':
                'SEPT 30, 2023', // Example date, you might want to use DateTime.now()
            'comment': _reviewController.text,
            'likes': 0,
          });
        });
      }
      _reviewController.clear(); // Clear the text field after submission
      Get.snackbar("Success", "Review submitted!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _editReview(int index) {
    setState(() {
      _editingIndex = index; // Set index for editing
      _reviewController.text =
          reviews[index]['comment']; // Populate text field with existing review
    });
  }

  void _deleteReview(int index) {
    setState(() {
      reviews.removeAt(index); // Remove review from list
    });
    Get.snackbar("Deleted", "Review deleted!",
        snackPosition: SnackPosition.BOTTOM);
  }
}
