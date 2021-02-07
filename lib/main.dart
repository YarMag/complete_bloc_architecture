import 'package:complete_bloc_architecture/di/injection.dart';
import 'package:complete_bloc_architecture/navigation/app_navigator.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/material.dart';

void main() {
  Injection.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteKeys.getInitialRoute(),
      routes: AppNavigator.routes,
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
