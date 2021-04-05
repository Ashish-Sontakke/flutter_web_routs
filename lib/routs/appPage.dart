import 'package:flutter/material.dart';
import 'package:flutter_web_routs/views/login.dart';
import 'package:flutter_web_routs/views/profile.dart';
import 'package:flutter_web_routs/views/settings.dart';
import 'package:flutter_web_routs/views/unknown.dart';

class AppSpecificPage extends Page {
  final String currentRoute;

  AppSpecificPage({
    this.currentRoute,
  }) : super(key: ValueKey(currentRoute));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        if (currentRoute == "settings") {
          return SettingsPageView();
        } else if (currentRoute == "profile") {
          return ProfilePageView();
        } else if (currentRoute == "login") {
          return LoginPageView();
        }
        return UnknownPageView();
      },
    );
  }
}
