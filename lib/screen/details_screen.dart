import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Column(
        children: [
          Center(
            child: Text('Details for item ID: $id'),
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go Back to Home Screen')),
        ],
      ),
    );
  }
}
