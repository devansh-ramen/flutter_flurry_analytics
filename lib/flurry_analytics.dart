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

    await _channel.invokeMethod<void>('initialize', args);
  }

  static Future<void> logEvent(
    String event, {
    Map<String, String> parameters,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("event", () => event);
    args.putIfAbsent("parameters", () => parameters ?? <String, String>{});

    await _channel.invokeMethod<void>('logEvent', args);
  }

  static Future<void> endTimedEvent(String event) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("event", () => event);

    await _channel.invokeMethod<void>('endTimedEvent', args);
  }

  static Future<void> setUserId(String userId) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("userId", () => userId);

    await _channel.invokeMethod<void>('userId', args);
  }
}
