import 'package:flutter/material.dart';
import 'package:notas/core/utils/app_alerts.dart';

extension AppAlerts on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(snackBarContent(
      message: message,
      context: this,
    ));
  }
}
