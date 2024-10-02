import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/database/database.dart';

class LocalAuthDataSource {
  LocalAuthDataSource(this._settingsBox);
  final Box<dynamic> _settingsBox;

  String? getToken() => _settingsBox.get('token');
  String? getRefreshToken() => _settingsBox.get('refreshToken');

  Future<void> changeToken(String token, String refreshToken) async {
    await _settingsBox.put('token', token);
    await _settingsBox.put('refreshToken', refreshToken);
  }

  Future<void> deleteToken() => Database.clear();
}
