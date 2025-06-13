import 'package:app_name/routes/auth_route.dart';
import 'package:app_name/routes/home_route.dart';
import 'package:app_name/routes/settings_route.dart';
import 'package:app_name/routes/splash.dart';
import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

SimpleRoutePage parseRoute(RouteInformation routeInformation) {
  final uri = routeInformation.uri;
  final path = uri.path;
  if (path == '/') {
    return AuthRoute();
  } else if (path == '/home') {
    return HomeRoute();
  } else if (path == '/settings') {
    return SettingsRoute();
  } else if (path == '/auth') {
    return AuthRoute();
  } else {
    return SplashRoute();
  }
}
