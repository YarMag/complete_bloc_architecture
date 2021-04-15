import 'package:complete_bloc_architecture/modules/common/controllers/message_controller.dart';
import 'package:complete_bloc_architecture/modules/common/error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import '../main_screen_wm.dart';

/// Builder for [MainScreenWidgetModel]
MainScreenWidgetModel createMainScreenWidgetModel(
    BuildContext context, {
      GlobalKey<ScaffoldState> scaffoldKey,
    }) {

  scaffoldKey ??= GlobalKey<ScaffoldState>();

  final dependencies = WidgetModelDependencies(
    errorHandler: DummyErrorHandler(DummyMessageController(scaffoldKey)),
  );

  return MainScreenWidgetModel(
    dependencies,
    Navigator.of(context),
    scaffoldKey,
  );
}
