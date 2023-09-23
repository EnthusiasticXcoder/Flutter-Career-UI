import 'package:flutter/material.dart' show immutable;

@immutable
abstract class MainEvent {
  const MainEvent();
}

class MainEventInitialise extends MainEvent {
  const MainEventInitialise();
}

class MainEventLogout extends MainEvent {
  const MainEventLogout();
}

class MainEventRegister extends MainEvent {
  final Map<String, Object?>? body;
  const MainEventRegister({this.body});
}

class MainEventLogin extends MainEvent {
  final String? username;
  final String? password;
  const MainEventLogin({this.username, this.password});
}
