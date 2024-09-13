import 'package:flutter/services.dart';

class VersionInfo {
  static const MethodChannel _channel = MethodChannel('app/version');

  // Método para obtener el nombre de la versión
  static Future<String> getVersionName() async {
    final String versionName = await _channel.invokeMethod('getVersionName');
    return versionName;
  }
}
