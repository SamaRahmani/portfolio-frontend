import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  final GlobalKey contactKey;

  const ContactSection({super.key, required this.contactKey});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final socialLinks = [
    {"icon": Icons.work, "label": "Naukri", "url": "https://www.naukri.com/yourprofile"},
    {"icon": Icons.business, "label": "LinkedIn", "url": "https://linkedin.com/in/yourprofile"},
    {"icon": Icons.code, "label": "LeetCode", "url": "https://leetcode.com/yourprofile"},
    {"icon": Icons.account_tree, "label": "GitHub", "url": "https://github.com/yourprofile"},
  ];

  bool isLoading = false;

  Future<void> sendMessage() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/messages"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent ✅")),
        );

        nameController.clear();
        emailController.clear();
        messageController.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error ❌")),
      );
    }

    setState(() => isLoading = false);
  }

  Future<void> openUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.contactKey,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      color: Colors.grey.shade200,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isMobile = width < 900;

          return isMobile
              ? mobileLayout()
              : desktopLayout();
        },
      ),
    );
  }

  /// 🔥 DESKTOP
  Widget desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: leftContent()),
        const SizedBox(width: 60),
        Expanded(flex: 4, child: form()),
      ],
    );
  }

  /// 🔥 MOBILE
  Widget mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leftContent(),
        const SizedBox(height: 50),
        form(),
      ],
    );
  }

  /// 🔥 LEFT CONTENT
  Widget leftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get in Touch with Sama",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        Text(
          "I'm always open to discussing new opportunities, interesting projects, or just having a chat about tech.",
          style: TextStyle(color: Colors.grey.shade700, height: 1.6),
        ),

        const SizedBox(height: 30),

        /// RESUME BUTTON
        GestureDetector(
          onTap: () => openUrl("/assets/pdf/resume.pdf"),
          child: Container(
            width: 220,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download, color: Colors.white),
                SizedBox(width: 10),
                Text("Download Resume", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 40),

        /// 🔥 SOCIAL GRID
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: socialLinks.map((item) {
            return socialCard(
              item["icon"] as IconData,
              item["label"] as String,
              item["url"] as String,
            );
          }).toList(),
        ),
      ],
    );
  }

  /// 🔥 FORM
  Widget form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        input("Your Name", nameController),
        const SizedBox(height: 20),
        input("Your Email", emailController),
        const SizedBox(height: 20),
        input("Your Message", messageController, maxLines: 5),
        const SizedBox(height: 30),

        GestureDetector(
          onTap: isLoading ? null : sendMessage,
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Send Message",
                    style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  /// 🔥 INPUT
  Widget input(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter $label",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 SOCIAL CARD
  Widget socialCard(IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => openUrl(url),
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}