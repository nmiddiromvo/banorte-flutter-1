import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexample/bloc/post/post_bloc.dart';
import 'package:myexample/bloc/post/post_event.dart';
import 'package:myexample/bloc/post/post_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Call Example')),
      body: SizedBox(
        width: double.maxFinite,
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          final posts = state.posts;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<PostBloc>().add(const LoadPostsEvent('123'));
                },
                child: const Text('Fetch Data'),
              ),
              state.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(35.0),
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            color: Colors.red.withOpacity(0.2),
                            child: ListTile(
                              title: Text(posts[index].title),
                              subtitle: Text(posts[index].body),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
