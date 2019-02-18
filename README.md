# flurry_analytics

A Flutter plugin to use Flurry Analytics. This plugin logs sessions, crash detections, simple event logging, UserId.

## Getting Started

This is a Flutter plugin to use Flurry Analytics. It implements native calls to [Flurry Android SDK][flurry_sdk_android] and [Flurry iOS SDK][flurry_sdk_ios]. The plugin logs sessions, crash detections, simple event logging, and UserId.



## Usage
import the library via
``` dart
import 'package:flurry_analytics/flurry_analytics.dart';
```

``` dart
await FlurryAnalytics.initialize(androidKey: "xxx", iosKey: "xxx", enableLog: true);
FlurryAnalytics.logEvent("event name");
```


[flurry_sdk_android]: https://developer.yahoo.com/flurry/docs/integrateflurry/android
[flurry_sdk_ios]: https://developer.yahoo.com/flurry/docs/integrateflurry/ios