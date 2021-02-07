import 'package:complete_bloc_architecture/bloc/bloc_provider.dart';
import 'package:complete_bloc_architecture/modules/menu/bloc/menu_bloc_interface.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  IMenuBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> tiles = _bloc
        .getMenuItems()
        .map((menuItem) => ListTile(
              title: Text(menuItem.title),
              onTap: () => _bloc.onMenuItemTap(menuItem.id),
            ))
        .toList();
    return Drawer(
      child: ListView(
        children: [DrawerHeader(child: Text("Main menu"))]..addAll(tiles),
      ),
    );
  }
}
