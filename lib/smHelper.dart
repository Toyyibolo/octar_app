import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceState extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void transistion() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}

final acnProvider = Provider<String>((ref) => 'Adekunle');
