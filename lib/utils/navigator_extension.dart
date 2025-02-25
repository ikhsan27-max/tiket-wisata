import 'package:flutter/material.dart';

extension NavigatorExtensions on BuildContext {
  void pushNamed(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void pop() {
    Navigator.pop(this);
  }
}
