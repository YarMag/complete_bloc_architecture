import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

import 'main_screen_wm.dart';

const List<BottomNavigationBarItem> _navBarItems = [
  BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "News"),
  BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
];

/// Widget
class MainScreen extends CoreMwwmWidget {
  final Widget _menuItem;
  final List<Widget> _tabs;

  MainScreen._(
    this._menuItem,
    this._tabs, {
    WidgetModelBuilder widgetModelBuilder,
  })  : assert(
          _tabs.length == _navBarItems.length,
          "Incorrect tabs passed!",
        ),
        super(
          widgetModelBuilder: widgetModelBuilder,
        );

  factory MainScreen({
    Widget menu,
    List<Widget> tabs,
    WidgetModelBuilder widgetModelBuilder,
  }) {
    return MainScreen._(menu, tabs, widgetModelBuilder: widgetModelBuilder);
  }

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends WidgetState<MainScreenWidgetModel> {

  @override
  Widget build(BuildContext context) {
    var w = widget as MainScreen; //небольшой костыль, надо поправить в пакете)
    
    return Scaffold(
      key: wm.scaffoldKey,
      appBar: AppBar(title: Text("mwwm sample app")),
      drawer: w._menuItem,
      body: StreamedStateBuilder<int>(
        streamedState: wm.currentIndex,
        builder: (context, index) {
          return w._tabs[index];
        }
      ),
      bottomNavigationBar: StreamedStateBuilder<int>(
        streamedState: wm.currentIndex,
        builder: (context, index) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: wm.togglePage,
            items: _navBarItems,
          );
        }
      ),
    );
  }
}
