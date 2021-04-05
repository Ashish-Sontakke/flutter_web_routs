import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  final ValueChanged<String> onButtonTapped;
  MyHomePage({this.onButtonTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    onButtonTapped('profile');
                  },
                  icon: Icon(Icons.account_circle),
                  label: Text("Profile"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    onButtonTapped('settings');
                  },
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    onButtonTapped('login');
                  },
                  icon: Icon(Icons.login_outlined),
                  label: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
