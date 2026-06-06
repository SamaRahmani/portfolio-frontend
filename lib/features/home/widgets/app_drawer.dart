import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(GlobalKey) onNavClick;
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;
  final GlobalKey blogKey;
  final GlobalKey skillsKey;
  final GlobalKey timelineKey;
  final GlobalKey contactKey;

  const AppDrawer({
    super.key,
    required this.onNavClick,
    required this.homeKey,
    required this.aboutKey,
    required this.projectsKey,
    required this.blogKey,
    required this.skillsKey,
    required this.timelineKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          /// 🔝 HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 40,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sama",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white24),

          /// 🔗 MENU ITEMS
          drawerItem(Icons.home, "Home", homeKey),
          drawerItem(Icons.person, "About", aboutKey),
          drawerItem(Icons.work, "Projects", projectsKey),
          drawerItem(Icons.article, "Blog", blogKey),
          drawerItem(Icons.code, "Skills", skillsKey),
          drawerItem(Icons.timeline, "Timeline", timelineKey),
          drawerItem(Icons.contact_mail, "Contact", contactKey),

          const Spacer(),

          /// 🔻 FOOTER
          Column(
            children: [
              const Divider(color: Colors.white24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.link, color: Colors.white70, size: 18),
                  SizedBox(width: 10),
                  Text(
                    "Connect with me",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                "© 2026 Sama",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }

  /// 🔹 DRAWER ITEM
  Widget drawerItem(IconData icon, String title, GlobalKey key) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => onNavClick(key),
    );
  }
}