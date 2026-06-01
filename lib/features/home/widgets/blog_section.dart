import 'package:flutter/material.dart';
import '../../blog/blog_detail_screen.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/paginated_grid.dart';
import '../../blog/blog_model.dart';
import '../../blog/blog_service.dart';

class BlogSection extends StatelessWidget {
  final GlobalKey blogKey;

  const BlogSection({
    super.key,
    required this.blogKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: blogKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Latest Blogs",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
  height: 390,
  child: FutureBuilder<List<Blog>>(
    future: BlogService.fetchBlogs(),
    builder: (context, snapshot) {

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }

      final blogs = snapshot.data!;

      return PaginatedGrid<Blog>(
        items: blogs,
        itemBuilder: (blog) {
          return AppCard(
            title: blog.title,
            description: blog.content,
            buttonText: "Read More",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailScreen(
                    title: blog.title,
                    content: blog.content,
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