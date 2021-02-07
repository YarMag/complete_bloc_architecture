import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/history_details/bloc/history_details_bloc.dart';
import 'package:complete_bloc_architecture/modules/history_details/bloc/history_details_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/history_details/bloc_context/history_details_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/history_details/ui/history_details_screen.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/navigation/screen_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';

class HistoryDetailsAssembly implements AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.mapWithParams<IHistoryDetailsBloc>((i, params) {
      final HistoryDetailsArgs args = params["input"] as HistoryDetailsArgs;
      assert(args != null, "Wrong args passed!");
      return HistoryDetailsBloc(historyItem: args.item);
    });

    injector.mapWithParams<Widget>((i, params) {
      return BlocProvider(
          child: HistoryDetailsScreen(),
          bloc: i.get<IHistoryDetailsBloc>(additionalParameters: params),
          blocContext: HistoryDetailsBlocContext());
    },
    key: RouteKeys.historyDetails);
  }
}