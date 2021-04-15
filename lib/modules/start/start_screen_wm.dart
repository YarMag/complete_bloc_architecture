import 'package:complete_bloc_architecture/modules/start/coordinator/coordinator.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

import '../../navigation/route_keys.dart';
import '../../services/startup/startup_service_interface.dart';

/// [WidgetModel] fo [StartScreen]
class StartScreenWidgetModel extends WidgetModel {
  StartScreenWidgetModel(
    WidgetModelDependencies dependencies,
    this._coordinator,
    this.scaffoldKey,
    this.startupService,
  ) : super(dependencies);

  final Coordinator _coordinator;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IStartupService startupService;

  final ready = StreamedState<bool>(false);

  @override
  void onLoad() {
    super.onLoad();

    doFuture(
      startupService.startup(),
      (data) {
        ready.accept(true);

        _coordinator.navigate(RouteKeys.main);
      },
    );
  }
}
