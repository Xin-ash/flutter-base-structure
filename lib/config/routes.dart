import 'package:flutter/material.dart';

class Routes {
  MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  Route? getRoutes(RouteSettings settings) {
    //return buildRoute(settings, const LoginPage());
    return null;
  }
}
