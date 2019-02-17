import 'dart:async';

import 'package:flutter/services.dart';

class FlurryAnalytics {
  static const MethodChannel _channel =
      const MethodChannel('flurry_analytics');

  static Future<Null> initialize({String androidKEY = "", String iosKEY = "", bool enableLog = true}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("api_key_android", () => androidKEY);
    args.putIfAbsent("api_key_ios", () => iosKEY);
    args.putIfAbsent("is_log_enabled", () => enableLog);

    await _channel.invokeMethod('initialize', args);

    return null;
  }

  static Future<Null> logEvent(String message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("message", () => message);

    await _channel.invokeMethod('logEvent', args);
    return null;
  }
}
