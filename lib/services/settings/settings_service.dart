import 'package:complete_bloc_architecture/entities/settings_item.dart';
import 'package:complete_bloc_architecture/services/settings/settings_service_interface.dart';

class SettingsService implements ISettingsService {
  Future<List<SettingsItem>> loadSettings() {
    return Future.delayed(
        const Duration(seconds: 2),
        () => [
              SettingsItem(value: true, title: "Push notifications"),
              SettingsItem(value: "InoDeveloper", title: "Your name")
            ]);
  }
}
