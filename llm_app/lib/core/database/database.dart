import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _settingsBox = 'settings';

class Database {
  static Box<dynamic> get settingsBox => Hive.box(_settingsBox);

  static Future<void> init() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    var containsEncryptionKey =
        await secureStorage.containsKey(key: 'encryptionKey');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'encryptionKey',
        value: base64UrlEncode(key),
      );
    }
    var encryptionKey =
        base64Url.decode((await secureStorage.read(key: 'encryptionKey'))!);
    await Future.wait([
      Hive.openBox<dynamic>(_settingsBox,
          encryptionCipher: HiveAesCipher(encryptionKey)),
    ]);
  }

  static Future<List<int>> clear() => Future.wait([
        settingsBox.clear(),
      ]);
}
