import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  void pushNamed(String route) {
    Navigator.of(this).pushNamed(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void replace(Widget oldScreen, Widget newScreen) {
    Navigator.of(this).replace(
        oldRoute: MaterialPageRoute(
          builder: (context) => oldScreen,
        ),
        newRoute: MaterialPageRoute(
          builder: (context) => newScreen,
        ));
  }

  void pushReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  void pushReplacementNamed(String screen) {
    Navigator.of(this).pushReplacementNamed(screen);
  }
}
