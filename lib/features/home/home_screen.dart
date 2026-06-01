import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/blog_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  // 🔑 Section Keys
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final blogKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  

  

  // 🔷 MAIN BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Navbar(
                    onNavClick: scrollToSection,
                    homeKey: homeKey,
                    aboutKey: aboutKey,
                    projectsKey: projectsKey,
                    blogKey: blogKey,
                    contactKey: contactKey,
                  ),
        
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(
          onViewProjects: () => scrollToSection(projectsKey),
        ),
                    const AboutSection(),
                    ProjectsSection(projectsKey: projectsKey),
                    BlogSection(blogKey: blogKey),
                    ContactSection(contactKey: contactKey),
                    const Footer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
