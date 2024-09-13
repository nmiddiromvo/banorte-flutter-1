class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['body'] as String,
    );
  }

  bool get isMexican => title.contains('Mexican');
}
