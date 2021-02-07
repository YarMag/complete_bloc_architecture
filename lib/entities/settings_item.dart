enum SettingsItemType { switcher, text, unknown }

class SettingsItem<T> {
  final SettingsItemType type;
  final T value;
  final String title;

  SettingsItem._({this.type, this.title, this.value});

  factory SettingsItem({String title, T value}) {
    SettingsItemType type = SettingsItemType.unknown;
    if (value is String) {
      type = SettingsItemType.text;
    } else if (value is bool) {
      type = SettingsItemType.switcher;
    }
    return SettingsItem._(type: type, title: title, value: value);
  }
}
