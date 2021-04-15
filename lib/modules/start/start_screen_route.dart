import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

import 'start_screen.dart';

/// Route for [StartScreen]
class StartScreenRoute extends MaterialPageRoute {
  StartScreenRoute(WidgetModelBuilder builder)
      : super(
          builder: (ctx) => StartScreen(
            widgetModelBuilder: builder,
          ),
        );
}
