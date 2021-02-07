
import 'package:flutter/material.dart';

class MainContainerScreen extends StatefulWidget {
  final Widget _menuItem;
  final List<Widget> _tabs;

  @override
  State<StatefulWidget> createState() => _MainContainerScreenState();

  MainContainerScreen._(this._menuItem, this._tabs);

  factory MainContainerScreen({Widget menu, List<Widget> tabs}) {
    return MainContainerScreen._(menu, tabs);
  }
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "News"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  @override
  void initState() {
    super.initState();

    assert(widget._tabs.length == _navBarItems.length, "Incorrect tabs passed!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc sample app")),
      drawer: widget._menuItem,
      body: widget._tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTap,
        items: _navBarItems,
      ),
    );
  }

  void _onNavBarItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}