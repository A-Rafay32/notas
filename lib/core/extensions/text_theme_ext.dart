import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
