import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexample/api/api_client.dart';
import 'package:myexample/bloc/post/post_event.dart';
import 'package:myexample/bloc/post/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));
      try {
        final posts = await ApiClient.getPosts(userId: event.userId);
        emit(state.copyWith(isLoading: false, posts: posts));
      } catch (_) {
        emit(state.copyWith(isLoading: false, hasError: true));
      }
    });
  }
}
