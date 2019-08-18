import 'package:flutter/material.dart';
import 'package:leancloud_functions/leancloud_functions.dart';
import 'list_screen.dart';

void main() {
  initPlatformState();
  runApp(MyApp());
}

void initPlatformState() {
  LeancloudFlutterPlugin leancloudFlutterPlugin =
      LeancloudFlutterPlugin.getInstance();
  String appId = "we7SwQORS2fuhgvo0ttOccDu-gzGzoHsz";
  String appKey = "AQvjLRoCKb6zpNkzskTs7kuH";
  leancloudFlutterPlugin.setLogLevel(LeancloudLoggerLevel.DEBUG);
  leancloudFlutterPlugin.setRegion(LeancloudCloudRegion.NorthChina);
  leancloudFlutterPlugin.initialize(appId, appKey);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leancloud Plugin example app',
      home: ListScreen(),
    );
  }
}
