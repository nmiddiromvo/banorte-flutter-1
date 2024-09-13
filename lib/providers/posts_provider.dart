import 'package:flutter/material.dart';
import 'package:myexample/api/api_client.dart';
import 'package:myexample/models/post.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> loadPosts() async {
    _isLoading = true;
    _hasError = false;

    notifyListeners();
    try {
      _posts = await ApiClient.getPosts();
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _hasError = true;
      _isLoading = false;
      notifyListeners();
    }
  }
}
