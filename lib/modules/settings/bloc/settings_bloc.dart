
import 'package:complete_bloc_architecture/services/settings/settings_service_interface.dart';
import 'package:complete_bloc_architecture/entities/settings_item.dart';
import 'package:complete_bloc_architecture/modules/settings/bloc/settings_bloc_interface.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc extends ISettingsBloc {
  final PublishSubject<List<SettingsItem>> _settingsSubject = PublishSubject();
  final ISettingsService _settingsService;

  SettingsBloc({ISettingsService settingsService}):
      _settingsService = settingsService;

  @override
  Stream<List<SettingsItem>> get outSettings => _settingsSubject.stream;

  void startup() async {
    List<SettingsItem> settings = await _settingsService.loadSettings();
    _settingsSubject.sink.add(settings);
  }

  @override
  void dispose() {
    // left empty to prevent stream closing
  }

}