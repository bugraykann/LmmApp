import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/database/database.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  runApp(const ProviderScope(child: App()));
}

Future<void> _initHive() async {
  await Hive.initFlutter('llm');
  await Database.init();
}
