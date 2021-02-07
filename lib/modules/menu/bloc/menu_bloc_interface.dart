
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/menu_item.dart';

abstract class IMenuBloc extends BlocBase {
  List<MenuItem> getMenuItems();
  void onMenuItemTap(int menuItemId);
}