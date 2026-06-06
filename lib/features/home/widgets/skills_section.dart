import 'package:flutter/material.dart';
import 'package:frontend/core/utils/url_launcher.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey skillsKey;

  SkillsSection({super.key, required this.skillsKey});

  final List<Map<String, String>> skills = [
    {
      "icon": "assets/icons/flutter.png",
      "name": "Flutter",
      "url": "https://github.com/yourprofile"
    },
    {
      "icon": "assets/icons/firebase.png",
      "name": "Firebase",
      "url": "https://firebase.google.com"
    },
    {
      "icon": "assets/icons/github.png",
      "name": "GitHub",
      "url": "https://github.com/yourprofile"
    },
    {
      "icon": "assets/icons/java.png",
      "name": "Java",
      "url": "https://yourblog.com/java"
    },
    {
      "icon": "assets/icons/jira.png",
      "name": "Jira",
      "url": "https://yourwork.com/jira"
    },
    {
      "icon": "assets/icons/kibana.png",
      "name": "Kibana",
      "url": "https://yourwork.com/kibana"
    },
    {
      "icon": "assets/icons/postman.png",
      "name": "Postman",
      "url": "https://yourwork.com/postman"
    },
    {
      "icon": "assets/icons/rest.png",
      "name": "REST API",
      "url": "https://yourblog.com/rest"
    },
    {
      "icon": "assets/icons/spring.png",
      "name": "Spring Boot",
      "url": "https://yourproject.com/backend"
    },
    {
      "icon": "assets/icons/sql.png",
      "name": "MySQL",
      "url": "https://yourblog.com/sql"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: skillsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          bool isMobile = width < 600;
          bool isTablet = width < 1000;

          double cardWidth = 280;

          if (isMobile) {
            cardWidth = width;
          } else if (isTablet) {
            cardWidth = (width / 2) - 30;
          }

          return Column(
            children: [
              /// 🔥 TITLE (CENTER)
              const Text(
                "My Skills",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// 🔥 DESCRIPTION (CENTER)
              const Text(
                "Technologies I use to build scalable and real-world applications.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 50),

              /// 🔥 SKILLS GRID
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 30,
                children: skills.map((skill) {
                  return SizedBox(
                    width: cardWidth,
                    child: skillCard(
                      skill["icon"]!,
                      skill["name"]!,
                      skill["url"]!,
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  /// 🔥 SKILL CARD
  Widget skillCard(String iconPath, String name, String url) {
    return _HoverCard(
      child: GestureDetector(
        onTap: () => openUrl(url),
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              /// ICON
              Image.asset(
                iconPath,
                width: 42,
                height: 42,
              ),

              const SizedBox(width: 20),

              /// NAME
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              /// LINK ICON
              const Icon(Icons.open_in_new, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔥 HOVER EFFECT
class _HoverCard extends StatefulWidget {
  final Widget child;

  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(4),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -5))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}