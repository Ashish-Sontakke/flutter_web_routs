import 'package:flutter/material.dart';
import 'package:flutter_web_routs/views/home_page.dart';
import 'package:flutter_web_routs/views/login.dart';
import 'package:flutter_web_routs/views/profile.dart';
import 'package:flutter_web_routs/views/settings.dart';
import 'package:flutter_web_routs/views/unknown.dart';

import 'appPath.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  String _selectedPath;
  bool show404 = false;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppRoutePath get currentConfiguration {
    print("currentConfiguration $_selectedPath");
    if (show404) {
      return AppRoutePath.unknown();
    } else if (_selectedPath == 'profile') {
      return AppRoutePath.profile();
    } else if (_selectedPath == 'settings') {
      return AppRoutePath.settings();
    } else if (_selectedPath == 'login') {
      return AppRoutePath.login();
    }
    return AppRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    List<Page> pages = <Page>[
      MaterialPage(
        key: ValueKey('homePage'),
        child: MyHomePage(
          onButtonTapped: _handleButtonTapped,
        ),
      ),
      if (show404)
        MaterialPage(key: ValueKey('UnknownPage'), child: UnknownPageView())
      else if (_selectedPath == 'profile')
        MaterialPage(child: ProfilePageView())
      else if (_selectedPath == 'settings')
        MaterialPage(child: SettingsPageView())
      else if (_selectedPath == 'login')
        MaterialPage(child: LoginPageView())
    ];

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedVeggie to null
        _selectedPath = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    print("setNewRoutePath $_selectedPath");
    if (path.isUnknown) {
      _selectedPath = null;
      show404 = true;
      print("1. setNewRoutePath $_selectedPath");
      return;
    } else if (path.isProfilePage) {
      _selectedPath = 'profile';
      print("2. setNewRoutePath $_selectedPath");
    } else if (path.isSettingsPage) {
      _selectedPath = 'settings';
      print("3. setNewRoutePath $_selectedPath");
    } else if (path.isLoginPage) {
      _selectedPath = 'login';
      print("4. setNewRoutePath $_selectedPath");
    } else {
      print("5. setNewRoutePath $_selectedPath");
      _selectedPath = null;
    }
    show404 = false;
  }

  void _handleButtonTapped(String page) {
    print("_handleButtonTapped");
    _selectedPath = page;
    notifyListeners();
  }
}
