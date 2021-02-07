import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';
import 'package:complete_bloc_architecture/modules/start/bloc/start_bloc.dart';
import 'package:complete_bloc_architecture/modules/start/bloc/start_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/start/bloc_context/start_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/start/ui/start_screen.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/services/startup/startup_service.dart';
import 'package:complete_bloc_architecture/services/startup/startup_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class StartAssembly implements AssemblyBase {
  void assemble({Injector injector}) {
    injector.map<IStartupService>((i) => StartupService());

    injector.mapWithParams<IStartBloc>((i, params) {
      final IStartupService service = i.get<IStartupService>();
      return StartBloc(startupService: service);
    });

    injector.mapWithParams<Widget>((i, params) {
      final IStartBloc bloc = i.get<IStartBloc>(additionalParameters: params);

      return BlocProvider(
          child: StartScreen(), bloc: bloc, blocContext: StartBlocContext());
    }, key: RouteKeys.start);
  }
}
