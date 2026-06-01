import 'dart:convert';
import 'package:http/http.dart' as http;
import 'blog_model.dart';

class BlogService {
  static Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(
      Uri.parse('http://localhost:8080/blogs'),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Blog.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}