import 'package:flutter/material.dart';
import 'package:flutter_web_routs/routs/routeInformationParser.dart';
import 'package:flutter_web_routs/routs/routerDelegate.dart';

import 'configure/configure_nonweb.dart'
    if (dart.library.html) 'configure/configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String state;

  RouteInformationParser _routeInformationParser = AppRouteInformationParser();
  RouterDelegate _routerDelegate = AppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Routs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
