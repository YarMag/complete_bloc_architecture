import 'package:complete_bloc_architecture/modules/main/di/main_screen_wm_builder.dart';
import 'package:complete_bloc_architecture/navigation/route_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:complete_bloc_architecture/di/assembly_base.dart';

import '../main_screen_route.dart';

class MainAssembly implements AssemblyBase {
  @override
  void assemble({Injector injector}) {
    injector.map<Route>((i) {
      final Widget newsTab = injector.get<Widget>(key: RouteKeys.news);
      final Widget historyTab = injector.get<Widget>(key: RouteKeys.history);
      final Widget settingsTab = injector.get<Widget>(key: RouteKeys.settings);
      final Widget menuItem = injector.get<Widget>(key: RouteKeys.menu);

      return MainScreenRoute(
        menu: menuItem,
        tabs: [newsTab, historyTab, settingsTab],
        widgetModelBuilder: (ctx) => createMainScreenWidgetModel(
          ctx,
        ),
      ); //Прикольный кейс, в моем случае решится костылем.
    }, key: RouteKeys.main);
  }
}
