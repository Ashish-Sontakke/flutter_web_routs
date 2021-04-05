import 'package:flutter/material.dart';
import 'package:flutter_web_routs/routs/appPath.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return AppRoutePath.home();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 1) {
      //todo
      print(uri.toString());
      if (uri.pathSegments[0] == 'profile') return AppRoutePath.profile();
      if (uri.pathSegments[0] == 'settings') return AppRoutePath.settings();
      if (uri.pathSegments[0] == 'login') return AppRoutePath.login();
      return AppRoutePath.unknown();
    }

    // Handle unknown routes
    return AppRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    print("restoreRouteInformation");
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isProfilePage) {
      return RouteInformation(location: '/profile');
    }
    if (path.isLoginPage) {
      return RouteInformation(location: '/login');
    }
    if (path.isSettingsPage) {
      return RouteInformation(location: '/settings');
    }
    return null;
  }
}
