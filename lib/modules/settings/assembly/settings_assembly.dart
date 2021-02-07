import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';
import 'package:complete_bloc_architecture/modules/settings/bloc/settings_bloc.dart';
import 'package:complete_bloc_architecture/modules/settings/bloc/settings_bloc_interface.dart';
import 'package:complete_bloc_architecture/modules/settings/bloc_context/settings_bloc_context.dart';
import 'package:complete_bloc_architecture/modules/settings/ui/settings_screen.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:complete_bloc_architecture/services/settings/settings_service.dart';
import 'package:complete_bloc_architecture/services/settings/settings_service_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class SettingsAssembly implements AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.map<ISettingsService>((i) => SettingsService());

    injector.map<ISettingsBloc>(
        (i) => SettingsBloc(settingsService: i.get<ISettingsService>()));

    injector.map<Widget>(
        (i) => BlocProvider(
            child: SettingsScreen(),
            bloc: i.get<ISettingsBloc>(),
            blocContext: SettingsBlocContext()),
        key: RouteKeys.settings);
  }
}
