
import 'package:complete_bloc_architecture/entities/settings_item.dart';

abstract class ISettingsService {
  Future<List<SettingsItem>> loadSettings();
}
