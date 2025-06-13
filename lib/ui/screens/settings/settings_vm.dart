part of 'settings_view.dart';

class SettingsViewModel with ChangeNotifier {
  final MainProvider _mainProvider;

  SettingsViewModel(this._mainProvider);

  bool get isDarkTheme => _mainProvider.themeData == ThemeData.dark();

  void setTheme(ThemeData themeData) {
    _mainProvider.setTheme(themeData);
  }
}
