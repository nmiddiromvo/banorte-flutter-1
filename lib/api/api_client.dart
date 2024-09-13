import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myexample/models/post.dart';

class ApiClient {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getPosts({String userId = ''}) async {
    const url = 'https://jsonplaceholder.typicode.com/posts'; // Sample API
    await Future.delayed(const Duration(
        seconds: 1)); //pongo delay porque la API responde muy rapido
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    final body = json.decode(response.body) as List<dynamic>;
    final List<Post> posts = [];
    for (final element in body) {
      posts.add(Post.fromMap(element));
    }

    return posts;
  }
}
