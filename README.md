# flurry_analytics

A Flutter plugin for communicating to Flurry Analytics. Allows for simple event logging, sessions, and crash detections.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.io/developing-packages/) for Flurry Analytics,
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## Usage
git remote add origin https://github.com/devansh-ramen/flutter_flurry_analytics.git
import the library via
``` dart
import 'package:flurry_analytics/flurry_analytics.dart';
```

``` dart
await FlurryAnalytics.initialize(androidKey: "QX7WZTNJ8468J6SR8DR3", iosKey: "XCCWQH4MCD45JHSM4BYN", enableLog: true);
FlurryAnalytics.logEvent("event name");
```