import 'dart:async';

import 'package:flutter/services.dart';

class FlurryAnalytics {
  static const MethodChannel _channel = const MethodChannel('flurry_analytics');

  static Future<void> initialize({
    String androidKey = "",
    String iosKey = "",
    bool enableLog = true,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("api_key_android", () => androidKey);
    args.putIfAbsent("api_key_ios", () => iosKey);
    args.putIfAbsent("is_log_enabled", () => enableLog);

    return await _channel.invokeMethod('initialize', args);
  }

  static Future<void> logEvent(
    String message, {
    Map<String, String> parameters,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("message", () => message);
    args.putIfAbsent("parameters", () => parameters ?? <String, String>{});

    return await _channel.invokeMethod('logEvent', args);
  }

  static Future<void> setUserId(String userId) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("userId", () => userId);

    return await _channel.invokeMethod('userId', args);
  }
}
