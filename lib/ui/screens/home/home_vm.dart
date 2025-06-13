import 'package:app_name/routes/settings_route.dart';
import 'package:app_name/di/main_provider.dart';
import 'package:flutter/widgets.dart';

class HomeVM with ChangeNotifier {
  final MainProvider mainProvider;

  HomeVM({required this.mainProvider});

  void goToSettings() {
    mainProvider.router.push(SettingsRoute());
  }
}
