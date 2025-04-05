import 'package:flutter/material.dart';
import 'package:sole_space_user/presentation/routes/app_routes.dart';

class AppNavigator {
  // Push a new route
  static void push(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Push a new route and remove the previous one
  static void pushReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  // Push a new route and remove all previous routes
  static void pushAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  // Pop the current route
  static void pop(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  // Pop until a specific route
  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, (route) => route.settings.name == routeName);
  }

  // Legacy methods for backward compatibility
  static void pushWidget(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void pushReplacementWidget(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
