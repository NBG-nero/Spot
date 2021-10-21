import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  bool darkTheme;
  SharedPreferences prefs;
  // ThemeProvider(this._themeData);

  ThemeProvider() {
    darkTheme = false;
  }

  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  initPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

//?Loads value of dark theme from sharedPreferences
  loadFromPref() async {
    await initPrefs();
    darkTheme = prefs.getBool('theme') ?? false;
    notifyListeners();
  }

  saveToPrefs() async {
    await initPrefs();
    prefs.setBool('theme', darkTheme);
  }

  toggleTheme(value) {
    darkTheme = value;
    saveToPrefs();
    notifyListeners();
  }
}
