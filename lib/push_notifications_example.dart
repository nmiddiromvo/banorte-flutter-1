import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationExample extends StatefulWidget {
  const PushNotificationExample({super.key});

  @override
  PushNotificationExampleState createState() => PushNotificationExampleState();
}

class PushNotificationExampleState extends State<PushNotificationExample> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Foreground message received: ${message.notification?.title}, ${message.notification?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('App opened from background/terminated state!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push Notifications Example')),
      body: const Center(
        child: Text('Waiting for notifications...'),
      ),
    );
  }
}
