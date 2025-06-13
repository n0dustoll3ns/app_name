import 'package:app_name/ui/screens/home/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

class HomeRoute extends DefaultSimpleRoutePage {
  @override
  String get name => '/home';

  @override
  Widget get view => HomeView();
}
