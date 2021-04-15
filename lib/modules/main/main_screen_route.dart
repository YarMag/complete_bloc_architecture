import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

import 'main_screen.dart';

/// Route for [MainScreen]
class MainScreenRoute extends MaterialPageRoute {
  MainScreenRoute({
    Widget menu,
    List<Widget> tabs,
    WidgetModelBuilder widgetModelBuilder,
  }) : super(
          builder: (ctx) => MainScreen(
            menu: menu,
            tabs: tabs,
            widgetModelBuilder: widgetModelBuilder,
          ),
        );
}
