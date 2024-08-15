import 'package:llm_app/core/extensions/extensions.dart';

extension EdgeInsetsExtension on EdgeInsetsGeometry {
  EdgeInsetsGeometry withStatusBarPadding(BuildContext context) =>
      add(EdgeInsets.only(top: context.padding.top));
  EdgeInsetsGeometry withSystemNavigationBarPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.padding.bottom));
  EdgeInsetsGeometry withBottomViewPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.viewPadding.bottom));
  EdgeInsetsGeometry withViewInsetsPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.viewInsets.bottom));
}
