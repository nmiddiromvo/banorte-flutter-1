import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text('Go Back to Home Screen'),
                ),
              ),
              const CombinedWidgetDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class CombinedWidgetDemo extends StatefulWidget {
  const CombinedWidgetDemo({super.key});

  @override
  State<CombinedWidgetDemo> createState() => _CombinedWidgetDemoState();
}

class _CombinedWidgetDemoState extends State<CombinedWidgetDemo> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            height:
                70), // Space between Cupertino and Material            const CupertinoNavigationBar(middle: Text('Cupertino Widgets')),

        CupertinoButton(
          onPressed: () {},
          color: CupertinoColors.activeBlue,
          child: const Text('Cupertino Button'),
        ),
        const SizedBox(height: 10),
        const CupertinoTextField(placeholder: 'Enter Text'),
        const SizedBox(height: 10),
        CupertinoSwitch(
            value: switchValue,
            onChanged: (v) => setState(() => switchValue = v)),
        const SizedBox(height: 10),
        const CupertinoActivityIndicator(),

        const SizedBox(height: 70), // Space between Cupertino and Material

        // Material Widgets
        AppBar(title: const Text('Material Widgets')),
        ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(labelText: 'Enter Text')),
        const SizedBox(height: 10),
        Switch(
            value: switchValue,
            onChanged: (v) => setState(() => switchValue = v)),
        const SizedBox(height: 10),
        const CircularProgressIndicator(),
      ],
    );
  }
}
