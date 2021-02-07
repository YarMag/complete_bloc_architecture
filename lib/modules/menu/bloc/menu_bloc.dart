
import 'package:complete_bloc_architecture/entities/menu_item.dart';
import 'package:complete_bloc_architecture/modules/menu/bloc/menu_bloc_interface.dart';

class MenuBloc extends IMenuBloc {
  final List<MenuItem> _items = [
    MenuItem(id: 1, title: "Action 1"),
    MenuItem(id: 2, title: "Action 2"),
    MenuItem(id: 3, title: "Action 3")
  ];

  void onMenuItemTap(int menuItemId) {
    print("Action $menuItemId was selected");
  }

  @override
  List<MenuItem> getMenuItems() {
    return _items;
  }

  @override
  void dispose() {
    // intentionally left empty to prevent closing subscriptions
  }
}
