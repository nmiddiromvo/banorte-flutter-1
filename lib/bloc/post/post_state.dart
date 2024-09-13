import 'package:equatable/equatable.dart';
import 'package:myexample/models/post.dart';

class PostState extends Equatable {
  final bool isLoading;
  final List<Post> posts;
  final bool hasError;
  const PostState({
    this.isLoading = false,
    this.posts = const [],
    this.hasError = false,
  });
  PostState copyWith({
    bool? isLoading,
    List<Post>? posts,
    bool? hasError,
  }) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, posts, hasError];
}
