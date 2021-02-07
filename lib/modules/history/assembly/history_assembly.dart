import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';
import 'package:complete_bloc_architecture/modules/history/bloc/history_bloc.dart';
import 'package:complete_bloc_architecture/modules/history/bloc/history_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/history/bloc_context/history_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/history/ui/history_screen.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/services/history/history_service.dart';
import 'package:complete_bloc_architecture/services/history/history_service_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class HistoryAssembly implements AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.map<IHistoryService>((i) => HistoryService());

    injector.map<IHistoryBloc>((i) => HistoryBloc(historyService: i.get<IHistoryService>()));

    injector.map<Widget>((i) => BlocProvider(
        child: HistoryScreen(),
        bloc: i.get<IHistoryBloc>(),
        blocContext: HistoryBlocContext()),
    key: RouteKeys.history);
  }
}
