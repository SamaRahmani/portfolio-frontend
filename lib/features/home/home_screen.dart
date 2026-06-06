import 'package:flutter/material.dart';
import 'widgets/app_drawer.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/blog_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';
import 'widgets/timeline_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  /// 🔑 SECTION KEYS
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final blogKey = GlobalKey();
  final skillsKey = GlobalKey();
  final timelineKey = GlobalKey();
  final contactKey = GlobalKey();

  /// 🔥 SCROLL FUNCTION (FIXED)
  void scrollToSection(GlobalKey key) {
  /// 🔥 Drawer close
  Navigator.of(context).maybePop();

  if (!_scrollController.hasClients) return;

  /// HOME FIX
  if (key == homeKey) {
    _scrollController.jumpTo(1);
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    return;
  }

  final sectionContext = key.currentContext;

  if (sectionContext != null) {
    /// 🔥 DELAY = smooth UX
    Future.delayed(const Duration(milliseconds: 200), () {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📱 DRAWER (MOBILE)
      drawer: AppDrawer(
  onNavClick: scrollToSection,
  homeKey: homeKey,
  aboutKey: aboutKey,
  projectsKey: projectsKey,
  blogKey: blogKey,
  skillsKey: skillsKey,
  timelineKey: timelineKey,
  contactKey: contactKey,
),

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
              skillsKey: skillsKey,
              timelineKey: timelineKey,
              contactKey: contactKey,
            ),

            /// 📜 SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(
                      homeKey: homeKey,
                      onViewProjects: () =>
                          scrollToSection(projectsKey),
                    ),

                    AboutSection(aboutKey: aboutKey),

                    ProjectsSection(projectsKey: projectsKey),

                    BlogSection(blogKey: blogKey),

                    SkillsSection(skillsKey: skillsKey),

                    TimelineSection(timelineKey: timelineKey),

                    ContactSection(contactKey: contactKey),

                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}