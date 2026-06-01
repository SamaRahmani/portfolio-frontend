import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const BlogDetailScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔵 TITLE
              Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // 🟢 META INFO
              const Text(
                "By Sama • 2026",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // 🔵 IMAGE
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Center(child: Text("Blog Image")),
              ),

              const SizedBox(height: 30),

              // 🔴 CONTENT
              Text(
                content,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}