import Flutter
import UIKit
import Flurry_iOS_SDK

public class SwiftFlurryAnalyticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flurry_analytics", binaryMessenger: registrar.messenger())
    let instance = SwiftFlurryAnalyticsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method.elementsEqual("initialize")) {
        let arguments = call.arguments as? NSDictionary
        let apiKey = arguments!["api_key_ios"] as? String
        let isLogEnabled = arguments!["is_log_enabled"] as? Bool

        if (isLogEnabled!) {
            Flurry.startSession(apiKey!, with: FlurrySessionBuilder
              .init()
              .withCrashReporting(true)
              .withLogLevel(FlurryLogLevelAll))

        } else {
            Flurry.startSession(apiKey!, with: FlurrySessionBuilder
                .init()
                .withCrashReporting(true)
                .withLogLevel(FlurryLogLevelNone))
        }

    } else if (call.method.elementsEqual("logEvent")) {
        let arguments = call.arguments as? NSDictionary
        let message = arguments!["message"] as? String
        Flurry.logEvent(message!);

    } else if (call.method.elementsEqual("userId")) {
        let arguments = call.arguments as? NSDictionary
        let userId = arguments!["userId"] as? String
        Flurry.setUserID(userId!)
    }
    result("iOS " + UIDevice.current.systemVersion)
  }



}
