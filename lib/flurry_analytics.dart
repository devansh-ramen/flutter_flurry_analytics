import 'dart:async';

import 'package:flutter/services.dart';

class FlurryAnalytics {
  static const MethodChannel channel = const MethodChannel('flurry_analytics');

  /// Initialize Flurry Analytics
  /// `performanceMetrics` is ONLY for Android
  static Future<void> initialize({
    required String androidKey,
    required String iosKey,
    bool enableLog = true,
    bool performanceMetrics = false,
    String? appVersion,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("api_key_android", () => androidKey);
    args.putIfAbsent("api_key_ios", () => iosKey);
    args.putIfAbsent("is_log_enabled", () => enableLog);
    args.putIfAbsent("is_performance_metrics", () => performanceMetrics);
    args.putIfAbsent("app_version", () => appVersion);

    await channel.invokeMethod<void>('initialize', args);
  }

  static Future<void> logEvent(
    String event, {
    Map<String, String>? parameters,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("event", () => event);
    args.putIfAbsent("parameters", () => parameters ?? <String, String>{});

    await channel.invokeMethod<void>('logEvent', args);
  }

  static Future<void> endTimedEvent(String event) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("event", () => event);

    await channel.invokeMethod<void>('endTimedEvent', args);
  }

  static Future<void> setUserId(String userId) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("userId", () => userId);

    await channel.invokeMethod<void>('userId', args);
  }
}
