import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flurry_analytics/flurry_analytics.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initFlurry();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initFlurry() async {
    await FlurryAnalytics.initialize(
        androidKey: "QX7WZTNJ8468J6SR8DR3",
        iosKey: "XCCWQH4MCD45JHSM4BYN",
        enableLog: true);
    await FlurryAnalytics.setUserId("1234");
    await FlurryAnalytics.logEvent("testflurry");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Flurry analytics example.'),
        ),
      ),
    );
  }
}
