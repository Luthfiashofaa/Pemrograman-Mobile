import 'package:flutter/material.dart';

class DescriptionFormPage extends StatefulWidget {
  @override
  _DescriptionFormPageState createState() => _DescriptionFormPageState();
}

class _DescriptionFormPageState extends State<DescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';
  String _facebookLink = '';
  String _twitterLink = '';
  String _linkedinLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Form'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Bio Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bio';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bio = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Facebook Link Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Facebook Link',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _facebookLink = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Twitter Link Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Twitter Link',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _twitterLink = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // LinkedIn Link Input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'LinkedIn Link',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _linkedinLink = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                      // You can send the data to your backend or save it locally
                      print('Name: $_name');
                      print('Bio: $_bio');
                      print('Facebook Link: $_facebookLink');
                      print('Twitter Link: $_twitterLink');
                      print('LinkedIn Link: $_linkedinLink');
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
