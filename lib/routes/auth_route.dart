import 'package:app_name/ui/screens/auth/auth_view.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

class AuthRoute extends DefaultSimpleRoutePage {
  @override
  String get name => '/auth';

  @override
  Widget get view => AuthView();
}
