import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexample/bloc/post/post_bloc.dart';
import 'package:myexample/bloc/post/post_state.dart';

class ScrollExamplesScreen extends StatelessWidget {
  const ScrollExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Screen Example'),
      ),
      body: Row(
        children: [
          // ListView.builder on the left side
          BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            return Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: state.posts.length, // Number of items
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: index % 2 == 0 ? Colors.red : Colors.blue,
                    child: Center(
                      child: Text('Elemento $index'),
                    ),
                  );
                },
              ),
            );
          }),
          const SizedBox(
            width: 30,
          ),
          // SingleChildScrollView with a Column on the right side
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(height: 50, color: Colors.red),
                Container(height: 50, color: Colors.green),
                Container(height: 50, color: Colors.blue),
                Container(height: 50, color: Colors.yellow),
                Container(height: 50, color: Colors.orange),
                Container(height: 50, color: Colors.purple),
                Container(height: 50, color: Colors.red),
                Container(height: 50, color: Colors.green),
                Container(height: 50, color: Colors.blue),
                Container(height: 50, color: Colors.yellow),
                Container(height: 50, color: Colors.orange),
                Container(height: 50, color: Colors.purple),
                Container(height: 50, color: Colors.red),
                Container(height: 50, color: Colors.green),
                Container(height: 50, color: Colors.blue),
                Container(height: 50, color: Colors.yellow),
                Container(height: 50, color: Colors.orange),
                Container(height: 50, color: Colors.purple),
                Container(height: 50, color: Colors.red),
                // Container(height: 50, color: Colors.green),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
