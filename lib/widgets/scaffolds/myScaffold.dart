import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final bool? backAble;
  final bool? safeViewport, safeTop, safeBottom;

  const MyScaffold({
    Key? key,
    required this.child,
    this.backAble,
    this.safeViewport,
    this.safeTop,
    this.safeBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: view(),
    );
  }

  AppBar? appbar(BuildContext context) {
    if (backAble ?? false) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
              ),
              const SizedBox(width: 5),
              const Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
    }
    return null;
  }

  Widget view() {
    if (safeViewport ?? false) {
      return SafeArea(
        top: safeTop ?? false,
        bottom: safeBottom ?? false,
        child: child,
      );
    } else {
      return child;
    }
  }
}
