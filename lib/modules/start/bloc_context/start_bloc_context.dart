
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/material.dart';
import 'package:complete_bloc_architecture/bloc/bloc_context_base.dart';
import 'package:complete_bloc_architecture/modules/start/bloc/start_bloc_interface.dart';

class StartBlocContext extends BlocContextBase<IStartBloc> {
  @override
  void subscribe(IStartBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((event) {
      switch (event.routeKey) {
        case RouteKeys.main:
          replaceWithRoute(event.routeKey, context);
          break;
        default:
          break;
      }
    });
  }
}