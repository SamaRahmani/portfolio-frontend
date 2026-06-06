import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;

  const AboutSection({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1100;

        return Container(
          key: aboutKey,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 40 : 80,
            vertical: 80,
          ),
          color: Colors.white,
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    aboutImage(isMobile),
                    const SizedBox(height: 30),
                    aboutText(isMobile),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: aboutImage(isMobile)),
                    SizedBox(width: isTablet ? 30 : 60),
                    Expanded(flex: 2, child: aboutText(isMobile)),
                  ],
                ),
        );
      },
    );
  }

  /// 🔥 IMAGE
  Widget aboutImage(bool isMobile) {
    return Container(
      height: isMobile ? 220 : 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/images/about.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 🔥 TEXT
  Widget aboutText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          "About Me",
          style: TextStyle(
            fontSize: isMobile ? 26 : 36,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        /// PARAGRAPH 1
        Text(
          "I am a Flutter developer who builds real-world scalable applications. "
          "I focus on clean architecture, performance, and user experience.",
          style: TextStyle(
            fontSize: isMobile ? 15 : 18,
            height: 1.6,
            color: Colors.grey.shade800,
          ),
        ),

        const SizedBox(height: 20),

        /// PARAGRAPH 2
        Text(
          "I have experience in frontend, backend (Java), and full-stack development. "
          "My goal is to create impactful software solutions.",
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            height: 1.6,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}