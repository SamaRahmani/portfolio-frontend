import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey contactKey;

  const ContactSection({
    super.key,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: contactKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Colors.grey.shade200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "Get in Touch with Sama",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
          ),

          const SizedBox(width: 60),

          Expanded(
            child: Column(
              children: [
                contactBox(Icons.email, "yourmail@gmail.com"),
                const SizedBox(height: 20),
                contactBox(Icons.phone, "+91-XXXXXXXXXX"),
                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: const Text(
                    "Download CV",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    socialBox(Icons.facebook),
                    socialBox(Icons.flutter_dash),
                    socialBox(Icons.work),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contactBox(IconData icon, String text) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget socialBox(IconData icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon),
    );
  }
}