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

  // 🔥 FINAL SCROLL FUNCTION
  void scrollToSection(GlobalKey key) {
    if (!_scrollController.hasClients) return;

    // ✅ HOME FIX (force scroll)
    if (key == homeKey) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
      return;
    }

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// 🔝 NAVBAR
            Navbar(
              onNavClick: scrollToSection,
              homeKey: homeKey,
              aboutKey: aboutKey,
              projectsKey: projectsKey,
              blogKey: blogKey,
              contactKey: contactKey,
            ),

            /// 🔽 SCROLL AREA
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    /// 🔥 HOME SECTION (IMPORTANT)
                    HeroSection(
                      homeKey: homeKey,
                      onViewProjects: () =>
                          scrollToSection(projectsKey),
                    ),

                    /// ABOUT
                    AboutSection(aboutKey: aboutKey),

                    /// PROJECTS
                    ProjectsSection(projectsKey: projectsKey),

                    /// BLOG
                    BlogSection(blogKey: blogKey),

                    /// CONTACT
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