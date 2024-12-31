import 'package:flutter/material.dart';
import 'package:assignment/data/models/post_model.dart';

class DetailScreen extends StatelessWidget {
  final PostsModel post;
  
  DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              post.body.toString(),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Chip(
              label: Text('User ID: ${post.userId}'),
              backgroundColor: Colors.teal.shade50,
              labelStyle: TextStyle(color: Colors.teal),
            ),
            Chip(
              label: Text('Post ID: ${post.id}'),
              backgroundColor: Colors.amber.shade50,
              labelStyle: TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
