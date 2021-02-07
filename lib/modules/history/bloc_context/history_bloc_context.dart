import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/material.dart';
import 'package:complete_bloc_architecture/bloc/bloc_context_base.dart';
import 'package:complete_bloc_architecture/modules/history/bloc/history_bloc_interface.dart';

class HistoryBlocContext extends BlocContextBase<IHistoryBloc> {
  @override
  void subscribe(IHistoryBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((event) {
      switch (event.routeKey) {
        case RouteKeys.historyDetails:
          goToRoute(event.routeKey, context, args: event.argument);
          break;
        default:
          break;
      }
    });
  }
}