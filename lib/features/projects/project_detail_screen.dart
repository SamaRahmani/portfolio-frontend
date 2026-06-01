import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;

  const ProjectDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔵 IMAGE SECTION
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(child: Text("Project Image")),
            ),

            const SizedBox(height: 30),

            // 🔴 TITLE
            Text(
              title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 DESCRIPTION
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // 🟡 TECH STACK
            const Text(
              "Tech Stack",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [
                chip("Flutter"),
                chip("Java"),
                chip("Spring Boot"),
              ],
            ),

            const SizedBox(height: 30),

            // 🔵 ACTION BUTTONS
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("GitHub"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Live Demo"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget chip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.grey.shade200,
    );
  }
}