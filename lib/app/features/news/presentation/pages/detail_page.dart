import 'package:flutter/material.dart';

// Halaman detail (placeholder)
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const DetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsItem['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(newsItem['author']),
      ),
    );
  }
}
