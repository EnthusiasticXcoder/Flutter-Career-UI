import 'package:flutter/material.dart';

class LoadingScreen {
  static bool isLoading = false;

  static Future showLoadingScreen(BuildContext context) {
    isLoading = true;
    return showDialog(context: context, builder: (context) => build());
  }

  static void hideLoadingScreen(BuildContext context) {
    var navigator = Navigator.of(context);
    if (isLoading && navigator.canPop()) navigator.pop();
  }

  static Widget build() {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                spreadRadius: -1.0,
                blurRadius: 10.0,
                offset: Offset(5.0, 5.0),
              ),
              BoxShadow(
                color: Colors.black12,
                spreadRadius: -1.0,
                blurRadius: 10.0,
                offset: Offset(-3.0, -3.0),
              ),
            ], borderRadius: BorderRadius.circular(24.0), color: Colors.white),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
