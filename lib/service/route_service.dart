import 'package:blockrx/ui/auth/screens/login_screen.dart';
import 'package:blockrx/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class RouteConstants {
  static const String login = "routeLogin";
  static const String dashboardScreen = "dashboardScreen";
}

final navigationKey = GlobalKey<NavigatorState>();

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    var _ = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RouteConstants.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteConstants.dashboardScreen:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
    }
    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('404!!'),
      ),
    );
  }

  static Future<T?> pushNamed<T extends Object?>(String route,
      {Map<String, dynamic>? arguments}) {
    return Navigator.of(navigationKey.currentContext!)
        .pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?>(String route,
      {Map<String, dynamic>? arguments}) {
    return Navigator.of(navigationKey.currentContext!)
        .pushReplacementNamed(route, arguments: arguments);
  }

  static void pop<T extends Object?>([T? result]) {
    return Navigator.of(navigationKey.currentContext!).pop<T>(result);
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.of(navigationKey.currentContext!)
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  static void popUntil(RoutePredicate predicate) {
    return Navigator.of(navigationKey.currentContext!).popUntil(predicate);
  }
}
