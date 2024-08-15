import 'package:llm_app/core/extensions/extensions.dart';

class ContextGeneralExtension {
  ContextGeneralExtension(BuildContext context) : _context = context;
  final BuildContext _context;
  MediaQueryData get mediaQuery => MediaQuery.of(_context);
  double get height => _context.mediaQuerySize.height;
  double get width => _context.mediaQuerySize.width;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
  Size get mediaSize => MediaQuery.sizeOf(_context);
}
