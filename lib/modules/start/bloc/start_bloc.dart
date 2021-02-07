
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/modules/start/bloc/start_bloc_interface.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/services/startup/startup_service_interface.dart';
import 'package:flutter/foundation.dart';

class StartBloc extends IStartBloc {
  final IStartupService _startupService;

  StartBloc({@required IStartupService startupService}):
        _startupService = startupService;

  @override
  Future<void> startup() async {
    await _startupService.startup();

    inUiEvents.add(BlocEvent(eventKey: RouteKeys.main));
  }

}