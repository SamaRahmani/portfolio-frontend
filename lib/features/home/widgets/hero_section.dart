import 'package:flutter/material.dart';
import 'package:frontend/core/utils/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final GlobalKey homeKey;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.homeKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: homeKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heroText(),
                    const SizedBox(height: 40),
                    heroImage(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 2, child: heroText()),
                    const SizedBox(width: 40),
                    Expanded(child: heroImage()),
                  ],
                );
        },
      ),
    );
  }

  /// 🔥 LEFT SIDE
  Widget heroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Hi, I'm",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 10),

        /// 🔥 NAME
        const Text(
          "Sama",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 10),

        /// 🔥 ROLE
        const Text(
          "Flutter Developer • Full Stack Engineer",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 20),

        /// 🔥 TAGLINE
        const Text(
          "I build scalable mobile and web applications with clean architecture and modern technologies.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 40),

        /// 🔥 BUTTONS
        Row(
          children: [
            /// ✅ RESUME BUTTON
            ElevatedButton(
              onPressed: () {
                openUrl("assets/pdf/resume.pdf");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 18),
              ),
              child: const Text("Download Resume"),
            ),

            const SizedBox(width: 20),

            /// ✅ PROJECT BUTTON
            OutlinedButton(
              onPressed: onViewProjects,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 18),
              ),
              child: const Text(
                "View Projects",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }

  /// 🔥 RIGHT SIDE IMAGE
  Widget heroImage() {
    return Center(
      child: Container(
        width: 320,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // 👈 slight round
          image: const DecorationImage(
            image: AssetImage("assets/images/profile.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}