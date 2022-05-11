import 'package:flutter/material.dart';

class Loading {
  late BuildContext context;
  late BuildContext dialogContext;

  bool isLoading = false;

  Loading(this.context);

  void openLoadingDialog() {
    isLoading = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return const Center(
          child: SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
            height: 80.0,
            width: 80.0,
          ),
        );
      },
    );
  }

  void dismissDialog() {
    isLoading = false;
    Navigator.of(dialogContext).pop();
  }
}
