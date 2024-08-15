import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppLocalizations get localization =>
      mounted ? AppLocalizations.of(this)! : AppLocalizationsEn();
  Size get mediaQuerySize => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Orientation get orientation => MediaQuery.orientationOf(this);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  bool get alwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(
          String content,
          {Duration duration = const Duration(seconds: 1)}) =>
      mounted
          ? ScaffoldMessenger.of(this).showSnackBar(
              SnackBar(content: Text(content), duration: duration))
          : null;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showErrorSnackBar(
          String content,
          {Duration duration = const Duration(seconds: 1)}) =>
      mounted
          ? ScaffoldMessenger.of(this).showSnackBar(SnackBar(
              content: Text(
                content,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: theme.colorScheme.error,
              duration: duration))
          : null;
}
