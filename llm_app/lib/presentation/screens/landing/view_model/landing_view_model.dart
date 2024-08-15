import 'package:flutter/material.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/core/config/config.dart';

class LandingViewModel extends BaseViewModel {
  LandingViewModel();

  int _selectedCardIndex = -1;

  int get selectedCardIndex => _selectedCardIndex;

  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
  }

  void selectCard(int index) {
    _selectedCardIndex = index;
    notifyListeners();
  }
}
