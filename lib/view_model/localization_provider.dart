import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale locale = Locale('en');

  void changeLocale(Locale localeValue) {
    locale = localeValue;
    notifyListeners();
  }
}
