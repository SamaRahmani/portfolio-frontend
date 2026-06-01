import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final Function(GlobalKey) onNavClick;
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;
  final GlobalKey blogKey;
  final GlobalKey contactKey;

  const Navbar({
    super.key,
    required this.onNavClick,
    required this.homeKey,
    required this.aboutKey,
    required this.projectsKey,
    required this.blogKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
  children: [
    // 🔵 LOGO IMAGE
    Image.asset(
      'assets/images/logo.png',
      height: 30,
    ),

    const SizedBox(width: 10),

    const Text(
      "Sama",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
          Row(
            children: [
              navItem("Home", homeKey),
              navItem("About", aboutKey),
              navItem("Projects", projectsKey),
              navItem("Blog", blogKey),
              navItem("Contact", contactKey),
            ],
          )
        ],
      ),
    );
  }

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
}