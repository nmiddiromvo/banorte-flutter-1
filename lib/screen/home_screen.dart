import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myexample/posts_screen.dart';
import 'package:myexample/method_channel_example.dart';
import 'package:myexample/push_notifications_example.dart';
import 'package:myexample/screen/scroll_examples_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.push('/second');
              },
              child: const Text('Go to Second Screen'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const MethodChannelExample()));
            },
            child: const Text('Method Channel Example'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PushNotificationExample()));
            },
            child: const Text('Push Notifications Example'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.push('/blocExample');
            },
            child: const Text('Go to Bloc Example'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.push(
                '/details/38',
              ); // Deep link to DetailsScreen with an ID
            },
            child: const Text('Go to Details Screen with ID 42'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostsScreen()));
            },
            child: const Text('API Call Example'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScrollExamplesScreen(),
                  ));
            },
            child: const Text('Scroll Examples'),
          ),
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Ejemplo column:'),
                  Text('Hola', style: TextStyle(fontSize: 24)),
                  Text('Mundo', style: TextStyle(fontSize: 24)),
                ],
              ),
              Column(
                children: [
                  Text('Ejemplo row:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 50),
                      Icon(Icons.star, size: 50),
                      Icon(Icons.settings, size: 50),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(12),
              // color: Colors.red.withOpacity(0.3),
              gradient: LinearGradient(colors: [
                Colors.red.withOpacity(0.3),
                Colors.yellow.withOpacity(0.7)
              ]),
            ),
            height: 100,
            width: 300,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.settings, size: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
