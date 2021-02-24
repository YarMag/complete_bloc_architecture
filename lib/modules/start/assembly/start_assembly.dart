import 'package:complete_bloc_architecture/di/assembly_base.dart';
import 'package:complete_bloc_architecture/modules/start/di/start_screen_wm_builder.dart';
import 'package:complete_bloc_architecture/modules/start/start_screen.dart';
import 'package:complete_bloc_architecture/modules/start/start_screen_route.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/services/startup/startup_service.dart';
import 'package:complete_bloc_architecture/services/startup/startup_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class StartAssembly implements AssemblyBase {
  void assemble({Injector injector}) {
    injector.map<IStartupService>((i) => StartupService());

    injector.mapWithParams<Route>(
      (i, params) {
        final IStartupService service = i.get<IStartupService>();

        return StartScreenRoute(
          (ctx) => createStartScreenWidgetModel(ctx, service),
        );
      },
      key: RouteKeys.start,
    );
  }
}
