import 'package:complete_bloc_architecture/di/assembly_base.dart';
import 'package:complete_bloc_architecture/modules/history/assembly/history_assembly.dart';
import 'package:complete_bloc_architecture/modules/history_details/assembly/history_details_assembly.dart';
import 'package:complete_bloc_architecture/modules/main/assembly/main_assembly.dart';
import 'package:complete_bloc_architecture/modules/menu/assembly/menu_assembly.dart';
import 'package:complete_bloc_architecture/modules/news/assembly/news_assembly.dart';
import 'package:complete_bloc_architecture/modules/settings/assembly/settings_assembly.dart';
import 'package:complete_bloc_architecture/modules/start/assembly/start_assembly.dart';
import 'package:complete_bloc_architecture/navigation/app_navigator.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class Injection {
  static final Injector injector = Injector();

  static final List<AssemblyBase> assemblies = [
    StartAssembly(),
    MenuAssembly(),
    MainAssembly(),
    HistoryAssembly(),
    HistoryDetailsAssembly(),
    NewsAssembly(),
    SettingsAssembly()
  ];

  static void initialize() {
    for (var assembly in assemblies) {
      assembly.assemble(injector: injector);
    }

    AppNavigator.initialize(injector: injector);
  }
}
