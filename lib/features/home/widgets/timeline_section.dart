import 'package:flutter/material.dart';

/// 🔥 MODEL
class TimelineItem {
  final String title;
  final String subtitle;
  final String description;
  final DateTime start;
  final DateTime? end;
  final bool isRange;

  TimelineItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.start,
    this.end,
    required this.isRange,
  });
}

class TimelineSection extends StatelessWidget {
  final GlobalKey timelineKey;

  TimelineSection({super.key, required this.timelineKey});

  final List<TimelineItem> items = [
    TimelineItem(
      title: "Major Projects",
      subtitle: "Flutter + Backend",
      description: "Production ready apps",
      start: DateTime(2026, 1),
      isRange: false,
    ),
    TimelineItem(
      title: "E-commerce App",
      subtitle: "Full Stack",
      description: "Payment + Admin panel",
      start: DateTime(2025, 3),
      isRange: false,
    ),
    TimelineItem(
      title: "Cognizant",
      subtitle: "Software Engineer",
      description: "Working on scalable Flutter apps",
      start: DateTime(2025, 1),
      end: DateTime.now(),
      isRange: true,
    ),
    TimelineItem(
      title: "Technophilia",
      subtitle: "Intern",
      description: "Frontend + Backend work",
      start: DateTime(2023, 7),
      isRange: false,
    ),
    TimelineItem(
      title: "College",
      subtitle: "B.Tech CSE",
      description: "Strong foundation in development",
      start: DateTime(2020, 6),
      end: DateTime(2024, 5),
      isRange: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sorted = [...items]..sort((a, b) => b.start.compareTo(a.start));

    return Container(
      key: timelineKey,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      color: Colors.grey.shade50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          if (width < 800) {
            return mobileTimeline(sorted);
          } else {
            return desktopTimeline(sorted);
          }
        },
      ),
    );
  }

  /// 🔥 DESKTOP TIMELINE
  Widget desktopTimeline(List<TimelineItem> sorted) {
    int? lastYear;

    return Column(
      children: [
        const Text(
          "Milestones & Growth",
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Each step reflects growth, challenges and evolution.",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 80),

        Stack(
          children: [
            /// CENTER LINE
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(width: 2, color: Colors.grey.shade300),
              ),
            ),

            Column(
              children: List.generate(sorted.length, (index) {
                final item = sorted[index];
                final isLeft = index % 2 == 0;

                bool showYear = lastYear != item.start.year;
                lastYear = item.start.year;

                return Column(
                  children: [
                    if (showYear) yearDivider(item.start.year),

                    Row(
                      children: [
                        Expanded(
                          child: isLeft
                              ? timelineCard(item, true)
                              : const SizedBox(),
                        ),

                        const SizedBox(width: 20),

                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: !isLeft
                              ? timelineCard(item, false)
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ],
    );
  }

  /// 🔥 MOBILE TIMELINE
  Widget mobileTimeline(List<TimelineItem> sorted) {
    int? lastYear;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Milestones & Growth",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "Each step reflects growth, challenges and evolution.",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 50),

        /// LEFT LINE
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            children: List.generate(sorted.length, (index) {
              final item = sorted[index];

              bool showYear = lastYear != item.start.year;
              lastYear = item.start.year;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showYear) yearDivider(item.start.year),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// LINE + DOT
                      Column(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 15),

                      /// CARD
                      Expanded(child: timelineCard(item, false)),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  /// 🔥 YEAR DIVIDER
  Widget yearDivider(int year) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          "----- $year -----",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  /// 🔥 CARD
  Widget timelineCard(TimelineItem item, bool isLeft) {
    return Container(
      margin: EdgeInsets.only(
        left: isLeft ? 0 : 0,
        right: isLeft ? 40 : 0,
        bottom: 30,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 4),

          Text(item.subtitle, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          Text(item.description),

          const SizedBox(height: 10),

          Text(
            item.end != null
                ? "${item.start.year} - ${item.end!.year}"
                : "${item.start.month}/${item.start.year}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}