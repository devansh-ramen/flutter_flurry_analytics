# flurry_analytics

A Flutter plugin to use Flurry Analytics. This plugin logs sessions, crash detections, simple event logging, UserId.

## Getting Started

This is a Flutter plugin to use Flurry Analytics. It implements native calls to [Flurry Android SDK][flurry_sdk_android] and [Flurry iOS SDK][flurry_sdk_ios]. The plugin logs sessions, crash detections, simple event logging, and UserId.

## Installation

Add `flurry_analytics: ^0.1.2` in your pubspec.yaml dependencies.

## How to use #

Importing the library :

``` dart
import 'package:flurry_analytics/flurry_analytics.dart';
```

Initialization :
(Before this, you must have the Android Key and iOS Key, from Flurry dashboard)

``` dart
await FlurryAnalytics.initialize(androidKey: "xxx", iosKey: "xxx", enableLog: true);
```

Logging/setting UserId :

``` dart
FlurryAnalytics.setUserId("1234");
```

Logging event:

``` dart
FlurryAnalytics.logEvent("event name");
```

Logging event with parameters:

``` dart
FlurryAnalytics.logEvent("event name", { "param1": "12"});
```

Logging the end of an event (to log duration):

``` dart
FlurryAnalytics.endTimedEvent("event name");
```

[flurry_sdk_android]: https://developer.yahoo.com/flurry/docs/integrateflurry/android
[flurry_sdk_ios]: https://developer.yahoo.com/flurry/docs/integrateflurry/ios