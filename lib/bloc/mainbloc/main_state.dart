import 'package:flutter/material.dart' show immutable;

@immutable
abstract class MainState {
  const MainState();
}

class MainStateUninitialised extends MainState {
  const MainStateUninitialised();
}

class MainStateLoggedOut extends MainState {
  const MainStateLoggedOut();
}

class MainStateLogIn extends MainState {
  const MainStateLogIn();
}

class MainStateRegister extends MainState {
  const MainStateRegister();
}

class MainStateLoggedIn extends MainState {
  const MainStateLoggedIn();
}
