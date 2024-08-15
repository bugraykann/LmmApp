import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:llm_app/core/extensions/context_extension.dart';

@optionalTypeArgs
abstract class StateX<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => context.theme;
  AppLocalizations get localization => context.localization;
  Size get size => context.mediaQuerySize;
  EdgeInsets get padding => context.padding;
  EdgeInsets get viewPadding => context.viewPadding;
  EdgeInsets get viewInsets => context.viewInsets;
  Orientation get orientation => context.orientation;
  double get devicePixelRatio => context.devicePixelRatio;
  bool get alwaysUse24HourFormat => context.alwaysUse24HourFormat;
}
