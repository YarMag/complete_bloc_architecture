import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/menu/bloc/menu_bloc.dart';
import 'package:complete_bloc_architecture/modules/menu/bloc/menu_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/menu/bloc_context/menu_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/menu/ui/menu_widget.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';

class MenuAssembly extends AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.map<IMenuBloc>((i) => MenuBloc());

    injector.map<Widget>((i) => BlocProvider(
        child: MenuWidget(),
        bloc: i.get<IMenuBloc>(),
        blocContext: MenuBlocContext()),
    key: RouteKeys.menu);
  }
}
