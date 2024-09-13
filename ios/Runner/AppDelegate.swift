import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let versionChannel = FlutterMethodChannel(name: "app/version", binaryMessenger: controller.binaryMessenger)

    versionChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "getVersionName" {
        // Obtiene el nombre de la versión desde el Info.plist
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
          result(version)
        } else {
          result(FlutterError(code: "UNAVAILABLE", message: "Version name not available", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
