import 'package:complete_bloc_architecture/modules/common/controllers/message_controller.dart';
import 'package:complete_bloc_architecture/modules/common/error_handler/error_handler.dart';
import 'package:complete_bloc_architecture/modules/start/coordinator/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import '../../../services/startup/startup_service_interface.dart';
import '../start_screen_wm.dart';

/// Builder for [StartScreenWidgetModel]
StartScreenWidgetModel createStartScreenWidgetModel(
  BuildContext context,
  IStartupService service,
) {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final dependencies = WidgetModelDependencies(
    errorHandler: DummyErrorHandler(DummyMessageController(scaffoldKey)),
  );

  return StartScreenWidgetModel(
    dependencies,
    Coordinator(context),
    scaffoldKey,
    service,
  );
}
