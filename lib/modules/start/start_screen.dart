import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';
import 'di/start_screen_wm_builder.dart';
import 'start_screen_wm.dart';

/// Widget
class StartScreen extends CoreMwwmWidget {
  StartScreen({
    WidgetModelBuilder widgetModelBuilder
  }) : super(
          widgetModelBuilder: widgetModelBuilder,
        );

  @override
  State<StatefulWidget> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends WidgetState<StartScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup screen"),
      ),
      key: wm.scaffoldKey,
      body: StreamedStateBuilder<bool>(
        streamedState: wm.ready,
        builder: (ctx, data) {
          if (data) {
            return Center(child: Text("Greetings!"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
