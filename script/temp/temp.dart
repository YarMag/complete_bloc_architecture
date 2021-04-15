import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'di/temp_wm_builder.dart';
import 'temp_wm.dart';

/// Widget
class $Temp$ extends CoreMwwmWidget {
  $Temp$({
    WidgetModelBuilder widgetModelBuilder = create$Temp$WidgetModel,
  }) : super(
          widgetModelBuilder: widgetModelBuilder,
        );

  @override
  State<StatefulWidget> createState() {
    return _$Temp$State();
  }
}

class _$Temp$State extends WidgetState<$Temp$WidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: wm.scaffoldKey,
      body: Text("temp screen"),
    );
  }
}
