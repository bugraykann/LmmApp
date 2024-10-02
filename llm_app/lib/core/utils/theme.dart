// ignore_for_file: deprecated_member_use

import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/extensions/extensions.dart';

class ClassicTheme {
  static ThemeData get dark => _theme(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF4CAF50),
          onPrimary: Colors.white,
          secondary: Color(0xFF3700B3),
          onSecondary: Colors.white,
          error: Color(0xFFCF6679),
          onError: Colors.white,
          background: Color(0xFF121212),
          onBackground: Colors.white,
          surface: Color(0xFF1E1E1E),
          onSurface: Colors.white,
        ),
      );

  static ThemeData _theme({required ColorScheme colorScheme}) => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        primaryColor: colorScheme.primary,
        primaryColorDark: colorScheme.primary.withOpacity(.2),
        primaryColorLight: colorScheme.primary.withOpacity(.2),
        fontFamily: 'Poppins',
        bottomAppBarTheme: const BottomAppBarTheme(
            elevation: 0, shape: CircularNotchedRectangle(), height: 50),
        iconTheme:
            IconThemeData(color: colorScheme.primary.withOpacity(1), size: 26),
        colorScheme: colorScheme,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: colorScheme.secondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          disabledBackgroundColor: colorScheme.primary.withOpacity(.25),
          disabledForegroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: Dimens.radiusButton.toBorderRadius()),
          elevation: 0,
        )),
        listTileTheme: ListTileThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: Dimens.radiusTile.toBorderRadius())),
        drawerTheme: DrawerThemeData(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            surfaceTintColor: colorScheme.surface),
        cardTheme: CardTheme(color: colorScheme.secondary, elevation: 0),
        textTheme: _textTheme(colorScheme),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          elevation: 0,
          titleTextStyle: TextStyle(color: colorScheme.onPrimary, fontSize: 22),
          iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 22),
          toolbarHeight: 75,
          centerTitle: true,
        ),
      );

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: TextStyle(color: colorScheme.onSurface),
        displayMedium: TextStyle(color: colorScheme.onSurface),
        displaySmall: TextStyle(color: colorScheme.onSurface),
        headlineLarge: TextStyle(color: colorScheme.onSurface),
        headlineMedium: TextStyle(color: colorScheme.onSurface),
        headlineSmall: TextStyle(color: colorScheme.onSurface),
        titleLarge: TextStyle(color: colorScheme.onSurface),
        titleMedium: TextStyle(color: colorScheme.onSurface),
        titleSmall: TextStyle(color: colorScheme.onSurface),
        bodyLarge: TextStyle(color: colorScheme.onSurface),
        bodyMedium: TextStyle(color: colorScheme.onSurface),
        bodySmall: TextStyle(color: colorScheme.onSurface),
      );
}
