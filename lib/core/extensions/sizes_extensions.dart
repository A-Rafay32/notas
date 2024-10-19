import 'package:flutter/widgets.dart';

extension MediaQuerySizes on BuildContext {
  double get h => MediaQuery.sizeOf(this).height;
  double get w => MediaQuery.sizeOf(this).width;

  double get halfY => MediaQuery.sizeOf(this).height * 0.5;
  double get halfX => MediaQuery.sizeOf(this).width * 0.5;
}
