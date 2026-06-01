import 'dart:convert';
import 'package:http/http.dart' as http;
import 'project_model.dart';

class ProjectService {
  static Future<List<Project>> fetchProjects() async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8080/projects"),
    );
    

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Project.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load projects");
    }
  }
}