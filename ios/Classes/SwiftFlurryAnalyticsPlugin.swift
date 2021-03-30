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
        handleInitialize(call, result)
    } else if (call.method.elementsEqual("logEvent")) {
        handleLogEvent(call, result)
    } else if (call.method.elementsEqual("endTimedEvent")) {
        handleEndTimedEvent(call, result)
    } else if (call.method.elementsEqual("userId")) {
        handleSetUserId(call, result)
    }
  }

  private func handleInitialize(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    if let _args = arguments {
      let apiKey = _args["api_key_ios"] as? String
      let isLogEnabled = _args["is_log_enabled"] as? Bool
      let version = _args["app_version"] as? String

      if let _apiKey = apiKey, let _isLog = isLogEnabled {
        var builder = FlurrySessionBuilder.init()
            .withLogLevel(_isLog ? FlurryLogLevelAll : FlurryLogLevelNone)
            .withCrashReporting(true)
        if let _version = version {
            builder = builder?.withAppVersion(_version)
        }
        
        Flurry.startSession(_apiKey, with: builder)
      }
    }
    result(nil)
  }

  private func handleLogEvent(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary

    if let _args = arguments {
      let event = _args["event"] as? String
      let parameters = _args["parameters"] as? [AnyHashable: Any]
      var timed = _args["timed"] as? Bool
      if timed == nil {timed = false}

      if let _event = event {

        Flurry.logEvent(_event, withParameters: parameters, timed: timed!);
      }
    }
    result(nil)
  }

  private func handleEndTimedEvent(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {

      let arguments = call.arguments as? NSDictionary

      if let _args = arguments {
        let event = _args["event"] as? String
        let parameters = _args["parameters"] as? [AnyHashable: Any]

        if let _event = event {

          Flurry.endTimedEvent(_event, withParameters: parameters);
        }
      }
    result(nil)
  }

  private func handleSetUserId(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    if let _args = arguments, let _userId = _args["userId"] as? String {
      Flurry.setUserID(_userId)
    }
    result(nil)
  }
}
