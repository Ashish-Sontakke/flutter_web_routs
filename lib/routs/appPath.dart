class AppRoutePath {
  final String page;
  final bool isUnknown;

  AppRoutePath.home()
      : page = null,
        isUnknown = false;
  AppRoutePath.profile()
      : page = 'profile',
        isUnknown = false;
  AppRoutePath.login()
      : page = 'login',
        isUnknown = false;
  AppRoutePath.settings()
      : page = 'settings',
        isUnknown = false;

  AppRoutePath.unknown()
      : page = null,
        isUnknown = true;

  bool get isHomePage => page == null;

  bool get isProfilePage => page == 'profile';
  bool get isSettingsPage => page == 'settings';
  bool get isLoginPage => page == 'login';
}
