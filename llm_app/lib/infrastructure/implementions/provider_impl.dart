import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/provider/provider.dart';

final settingsProviderImpl =
    ChangeNotifierProvider((ref) => SettingsProvider());
