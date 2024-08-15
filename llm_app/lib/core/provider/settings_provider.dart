import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/database/database.dart';
import 'package:llm_app/core/enum/enum.dart';

class SettingsProvider extends ChangeNotifier {
  Box<dynamic> get _box => Database.settingsBox;

  ThemeMode get themeMode =>
      ThemeMode.values[_box.get('themeMode', defaultValue: 0)];
  Languages get language =>
      Languages.values[_box.get('language', defaultValue: 0)];

  void changeThemeMode(ThemeMode? value) => _update('themeMode', value?.index);
  void changeLanguage(Languages? value) => _update('language', value?.index);

  Future<void> _update(String key, dynamic value) async {
    await _box.put(key, value);
    notifyListeners();
  }

  void clear() => _box.clear();
}
