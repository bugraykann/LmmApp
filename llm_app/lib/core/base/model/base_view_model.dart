import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? _context;
  BuildContext get context => _context!;
  set context(BuildContext context) => _context = context;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  changeLoading(bool value, [bool notify = true]) {
    _isLoading = value;
    if (notify) notifyListeners();
  }

  bool _showSuffix = false;
  bool get showSuffix => _showSuffix;
  changeSuffix(bool value) {
    _showSuffix = value;
    notifyListeners();
  }

  bool get mounted => _context?.mounted == true;

  @override
  void notifyListeners() {
    if (!mounted) return;
    super.notifyListeners();
  }
}
