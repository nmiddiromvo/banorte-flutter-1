import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostsEvent extends PostEvent {
  final String userId;

  const LoadPostsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
