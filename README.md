# flurry_analytics

A Flutter plugin to use Flurry Analytics. This version logs sessions, crash detections, simple event logging, UserId. We plan to add more features.

## Getting Started

This project is a Flutter plugin to use Flurry Analytics. We have integrated Flurry's Android and iOS SDKs and ported method calls for Flurry projects. Currently, we allow only for logs sessions, crash detections, simple event logging, UserId.
https://developer.yahoo.com/flurry/docs/integrateflurry


## Usage
import the library via
``` dart
import 'package:flurry_analytics/flurry_analytics.dart';
```

``` dart
await FlurryAnalytics.initialize(androidKey: "xxx", iosKey: "xxx", enableLog: true);
FlurryAnalytics.logEvent("event name");
```