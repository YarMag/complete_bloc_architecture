import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

import '../../navigation/route_keys.dart';
import '../../services/startup/startup_service_interface.dart';

/// [WidgetModel] fo [StartScreen]
class StartScreenWidgetModel extends WidgetModel {
  StartScreenWidgetModel(
    WidgetModelDependencies dependencies,
    this._navigator,
    this.scaffoldKey,
    this.startupService,
  ) : super(dependencies);

  final NavigatorState _navigator;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IStartupService startupService;

  final ready = StreamedState<bool>(false);

  @override
  void onLoad() {
    super.onLoad();

    doFuture(startupService.startup(), (data) {
      ready.accept(true);

      _navigator.pushReplacementNamed(RouteKeys.main);
     });
  }
}
