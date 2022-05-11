import 'package:flutter/material.dart';
import '../globals.dart';
import '../controllers.dart';

class SystemAuthController {
  late BuildContext buildContext;
  late DbAuth dbAuth;

  SystemAuthController(BuildContext buildContext) {
    buildContext = buildContext;
    dbAuth = DbAuth();
  }

  void userLogout() {
    dbAuth.setLogin(false);
    Globals.isLoggedIn = false;
  }
}
