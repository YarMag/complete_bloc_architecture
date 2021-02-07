
import 'package:complete_bloc_architecture/bloc/bloc_base.dart';
import 'package:complete_bloc_architecture/entities/settings_item.dart';

abstract class ISettingsBloc extends BlocBase {
  Stream<List<SettingsItem>> get outSettings;

  void startup();
}