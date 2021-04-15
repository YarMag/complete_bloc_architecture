
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/navigation/screen_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'route_keys.dart';
import 'route_keys.dart';

class AppNavigator {
  static Map<String, Route Function(RouteSettings)> _routes;
  static Injector _injector;
  static Map<String, Route Function(RouteSettings)> get routes => _routes;

  static void initialize({@required Injector injector}) {
    _injector = injector;

    _routes = {
      RouteKeys.start: (RouteSettings rs) =>
          injector.get<Route>(key: RouteKeys.start),
      RouteKeys.main: (RouteSettings rs) =>
          injector.get<Route>(key: RouteKeys.main)
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteKeys.main : 
        return _routes[RouteKeys.main](settings);
      case RouteKeys.start:
        return _routes[settings.name](settings);
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