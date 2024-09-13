import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myexample/version_info/version_info.dart';

class MethodChannelExample extends StatefulWidget {
  static const platform = MethodChannel('com.example/my_channel');

  const MethodChannelExample({super.key});

  @override
  State<MethodChannelExample> createState() => _MethodChannelExampleState();
}

class _MethodChannelExampleState extends State<MethodChannelExample> {
  Future<void> _getNativeData() async {
    try {
      final versionName = await VersionInfo.getVersionName();
      showMessage('Este es la version: $versionName');
    } catch (error) {
      showMessage(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel Example'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: _getNativeData,
          child: const Text('Get Native Data'),
        ),
      ),
    );
  }

  void showMessage(String text) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Version'),
          content: Text(text),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
