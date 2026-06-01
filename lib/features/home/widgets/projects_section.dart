import 'package:flutter/material.dart';
import '../../projects/project_model.dart';
import '../../projects/project_service.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/paginated_grid.dart'; // ✅ IMPORTANT
import '../../projects/project_detail_screen.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey projectsKey;

  const ProjectsSection({
    super.key,
    required this.projectsKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: projectsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Projects",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            height: 390, // थोड़ा बढ़ाया for grid
            child: FutureBuilder<List<Project>>(
              future: ProjectService.fetchProjects(),
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                final projects = snapshot.data!;

                return PaginatedGrid<Project>(
                  items: projects,
                  itemBuilder: (project) {
                    return AppCard(
                      title: project.title,
                      description: project.description,
                      buttonText: "View Project",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailScreen(
                              title: project.title,
                              description: project.description,
                              images: project.images,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}