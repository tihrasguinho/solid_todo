import 'package:flutter/material.dart';

class Snackbars {
  const Snackbars();

  static final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  static Widget builder(BuildContext context, Widget? child) {
    return Scaffold(
      key: _scaffoldKey,
      body: child,
    );
  }

  static void removeSnackbar() {
    final context = _scaffoldKey.currentContext;

    if (context == null) return;

    return ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  static void showSnackbar(
    String message, {
    Duration? duration,
    Color? backgroundColor,
    Color? textColor,
    SnackBarAction? action,
  }) {
    final context = _scaffoldKey.currentContext;

    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 5),
        backgroundColor: backgroundColor,
        action: action,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static void showSuccessSnackbar(String message, {Duration? duration}) {
    return showSnackbar(
      message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void showErrorSnackbar(String message, {Duration? duration}) {
    return showSnackbar(
      message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
