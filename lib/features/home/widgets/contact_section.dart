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
    {"icon": Icons.work, "url": "https://www.naukri.com/yourprofile"},
    {"icon": Icons.business, "url": "https://linkedin.com/in/yourprofile"},
    {"icon": Icons.code, "url": "https://leetcode.com/yourprofile"},
    {"icon": Icons.account_tree, "url": "https://github.com/yourprofile"},
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

    if (!emailController.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid email")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final url = Uri.parse("http://localhost:8080/messages");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent successfully ✅")),
        );

        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        throw Exception("Failed");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error sending message ❌")),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Colors.grey.shade200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 LEFT SIDE (70%)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADING
                Text(
                  "Get in Touch with Sama",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 PARAGRAPH (light color)
                Text(
                  "I'm always open to discussing new opportunities, interesting projects, or just having a chat about tech. Feel free to reach out through any platform below.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 30),

                /// DOWNLOAD CV
                GestureDetector(
                  onTap: () {
                    openUrl("/assets/pdf/resume.pdf");
                  },
                  child: Container(
  width: 250,
  height: 50,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(6), // ✅ now works
  ),
  alignment: Alignment.center,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.download, color: Colors.white),
      SizedBox(width: 10),
      Text(
        "Download Resume",
        style: TextStyle(color: Colors.white),
      ),
    ],
  ),
),
                ),

                const SizedBox(height: 40),

                /// SOCIAL LINKS
                Row(
                  children: socialLinks.map((item) {
                    String label = "";
                    if (item["icon"] == Icons.work) label = "Naukri";
                    if (item["icon"] == Icons.business) label = "LinkedIn";
                    if (item["icon"] == Icons.code) label = "LeetCode";
                    if (item["icon"] == Icons.account_tree) label = "GitHub";

                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: socialCard(
                        item["icon"] as IconData,
                        label,
                        item["url"] as String,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          /// 🔥 RIGHT SIDE (30%)
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your Name"),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Your Email"),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Your Message"),
                const SizedBox(height: 8),
                TextField(
                  controller: messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write your message here...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                GestureDetector(
                  onTap: isLoading ? null : sendMessage,
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Send Message",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialCard(IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => openUrl(url),
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 32, color: Colors.black),

            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Icon(Icons.open_in_new, size: 16)
          ],
        ),
      ),
    );
  }
}