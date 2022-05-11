import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/routes.dart';
import '../custom.dart';

class InitialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InitialPageState();
  }
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes().getRoutes,
      theme: ThemeData(
        primaryColor: Custom.PRIMARY_COLOR,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff0f5ac1),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white,
        //child: const LandingPage(),
      ),
    );
  }
}
