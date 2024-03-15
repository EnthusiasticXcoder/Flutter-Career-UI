import 'package:flutter/material.dart' show immutable;

@immutable
abstract class MainState {
  final bool isLoading;
  final String? message;
  const MainState({required this.isLoading, this.message});
}

class MainStateUninitialised extends MainState {
  const MainStateUninitialised({required super.isLoading});
}

class MainStateLoggedOut extends MainState {
  const MainStateLoggedOut({required super.isLoading});
}

class MainStateLogIn extends MainState {
  const MainStateLogIn({required super.isLoading, super.message});
}

class MainStateRegister extends MainState {
  const MainStateRegister({required super.isLoading});
}

class MainStateLoggedIn extends MainState {
  const MainStateLoggedIn({required super.isLoading});
}
