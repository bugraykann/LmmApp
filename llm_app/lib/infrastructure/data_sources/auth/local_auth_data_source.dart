import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/database/database.dart';

class LocalAuthDataSource {
  LocalAuthDataSource(this._settingsBox);
  final Box<dynamic> _settingsBox;

  String? getToken() => _settingsBox.get('token');

  Future<void> changeToken(String token) => _settingsBox.put('token', token);

  Future<void> deleteToken() => Database.clear();
}
