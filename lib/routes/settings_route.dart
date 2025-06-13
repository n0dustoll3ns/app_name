import 'package:app_name/ui/screens/settings/settings_view.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

class SettingsRoute extends SimpleRoutePage {
  @override
  String get name => '/settings';
  @override
  Widget get view => SettingsView();
}
