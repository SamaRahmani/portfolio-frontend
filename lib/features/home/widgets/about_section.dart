import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Colors.white,
      child: Row(
        children: [
          // LEFT IMAGE
          Expanded(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Your Image"),
              ),
            ),
          ),

          const SizedBox(width: 60),

          // RIGHT TEXT
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "About Me",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "I am a Flutter developer who builds real-world scalable applications. "
                  "I focus on clean architecture, performance, and user experience.",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "I have experience in frontend, backend (Java), and full-stack development. "
                  "My goal is to create impactful software solutions.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}