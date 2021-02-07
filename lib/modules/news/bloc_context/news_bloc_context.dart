import 'package:complete_bloc_architecture/navigation/alert_keys.dart';
import 'package:flutter/material.dart';
import 'package:complete_bloc_architecture/bloc/bloc_context_base.dart';
import 'package:complete_bloc_architecture/modules/news/bloc/news_bloc_interface.dart';

class NewsBlocContext extends BlocContextBase<INewsBloc> {
  @override
  void subscribe(INewsBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((event) {
      switch (event.routeKey) {
        case AlertKeys.error:
          showError(error: event.argument, context: context);
      }
    });
  }
}