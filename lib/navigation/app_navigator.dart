
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/navigation/screen_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AppNavigator {
  static Map<String, Widget Function(BuildContext)> _routes;
  static Injector _injector;
  static Map<String, Widget Function(BuildContext)> get routes => _routes;

  static void initialize({@required Injector injector}) {
    _injector = injector;

    _routes = {
      RouteKeys.start: (BuildContext context) =>
          injector.get<Widget>(key: RouteKeys.start),
      RouteKeys.main: (BuildContext context) =>
          injector.get<Widget>(key: RouteKeys.main)
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteKeys.historyDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => _injector.get<Widget>(
                key: RouteKeys.historyDetails,
                additionalParameters: _wrapArguments<HistoryDetailsArgs>(settings)));
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => Scaffold(
                body: Center(child: Text("Unknown screen was requested"))));
    }
  }

  static Map<String, dynamic> _wrapArguments<T>(RouteSettings settings) {
    return { "input": settings.arguments as T };
  }
}