import 'package:dartx/dartx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:llm_app/core/config/config.dart';
import 'package:llm_app/core/utils/theme.dart';

import '../infrastructure/implementions/provider_impl.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(settingsProviderImpl);
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          locale: provider.language.locale,
          theme: ClassicTheme.dark,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: Routes.routerConfig,
          localeResolutionCallback: (locale, supportedLocales) {
            final supportedLocale = supportedLocales.firstOrNullWhere(
                    (x) => x.toString() == locale?.languageCode) ??
                const Locale('en');
            Intl.defaultLocale = supportedLocale.toString();
            return supportedLocale;
          },
        ),
      );
    });
  }
}
