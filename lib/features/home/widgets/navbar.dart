import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final Function(GlobalKey) onNavClick;
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;
  final GlobalKey blogKey;
  final GlobalKey skillsKey;
  final GlobalKey timelineKey;
  final GlobalKey contactKey;

  const Navbar({
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
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: isMobile ? mobileNav(context) : desktopNav(),
    );
  }

  /// 💻 DESKTOP NAVBAR
  Widget desktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logo(),

        Row(
          children: [
            navItem("Home", homeKey),
            navItem("About", aboutKey),
            navItem("Projects", projectsKey),
            navItem("Blog", blogKey),
            navItem("Skills", skillsKey),
            navItem("Timeline", timelineKey),
            navItem("Contact", contactKey),
          ],
        )
      ],
    );
  }

  /// 📱 MOBILE NAVBAR
  Widget mobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logo(),

        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ],
    );
  }

  /// 🔵 LOGO
  Widget logo() {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 28,
        ),
        const SizedBox(width: 8),
        const Text(
          "Sama",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// 🔹 NAV ITEM (DESKTOP)
  Widget navItem(String title, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () => onNavClick(key),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// 📱 DRAWER (CALL THIS IN SCAFFOLD)
  static Drawer buildDrawer({
    required Function(GlobalKey) onNavClick,
    required GlobalKey homeKey,
    required GlobalKey aboutKey,
    required GlobalKey projectsKey,
    required GlobalKey blogKey,
    required GlobalKey skillsKey,
    required GlobalKey timelineKey,
    required GlobalKey contactKey,
  }) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              "Sama",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),

          drawerItem("Home", homeKey, onNavClick),
          drawerItem("About", aboutKey, onNavClick),
          drawerItem("Projects", projectsKey, onNavClick),
          drawerItem("Blog", blogKey, onNavClick),
          drawerItem("Skills", skillsKey, onNavClick),
          drawerItem("Timeline", timelineKey, onNavClick),
          drawerItem("Contact", contactKey, onNavClick),
        ],
      ),
    );
  }

  /// 📱 DRAWER ITEM
  static Widget drawerItem(
      String title, GlobalKey key, Function(GlobalKey) onNavClick) {
    return ListTile(
      title: Text(title),
      onTap: () => onNavClick(key),
    );
  }
}