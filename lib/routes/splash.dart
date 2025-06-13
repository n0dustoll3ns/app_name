import 'package:app_name/ui/screens/splash/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

class SplashRoute extends DefaultSimpleRoutePage {
  @override
  String get name => '/splash';

  @override
  Widget get view => SplashView();
}
