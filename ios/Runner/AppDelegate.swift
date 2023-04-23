import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let androidChannel = FlutterMethodChannel(name: "flutterChannel",
                                              binaryMessenger: controller.binaryMessenger)

        androidChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "startTapPaySetting" else {
              result("error: no iOS method")
              return
            }
            result("af5d217eec3baf9c4640aba72f2b3bfb373f5df360f5001c9e6d9030b8df98a5")
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
