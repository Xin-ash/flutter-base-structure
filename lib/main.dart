import 'package:flutter/material.dart';
import 'database/DbAuth.dart';
import 'globals.dart';
import 'modules/initialPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ///Check Account Status
  DbAuth().getLocalConfig().then((localConfig) {
    if (localConfig.login) {
      Globals.isLoggedIn = true;
    }
  });

  WidgetsFlutterBinding.ensureInitialized();

  runApp(InitialPage());
}
