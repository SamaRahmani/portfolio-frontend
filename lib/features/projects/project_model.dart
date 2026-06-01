class Project {
  final String title;
  final String description;
  final List<String> images;

  Project({
    required this.title,
    required this.description,
    required this.images,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }
}