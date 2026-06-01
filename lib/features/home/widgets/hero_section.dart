import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final GlobalKey homeKey;

 

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.homeKey
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: homeKey,
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      color: Colors.black,
      child: Row(
        children: [
          // LEFT TEXT
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, I'm Sama",
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Flutter Developer | Building Real Solutions",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: onViewProjects,
                  child: const Text("View Projects"),
                ),
              ],
            ),
          ),

          // RIGHT IMAGE
          Expanded(
            child: Container(
              height: 300,
              color: Colors.grey.shade800,
              child: const Center(
                child: Text(
                  "Your Image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}