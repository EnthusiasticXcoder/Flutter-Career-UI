import 'package:flutter/material.dart' show immutable;
import 'package:fluttercareerui/constants/constants.dart';

@immutable
class APIUser {
  final String token;
  final String? userName;
  final String? email;
  final String? firstName;
  final String? lastName;

  const APIUser(
    this.userName,
    this.email,
    this.firstName,
    this.lastName,
    this.token,
  );

  APIUser.fromjson(Map<String, Object?> map, String key)
      : token = key,
        email = map[AppConstants.emailField] as String,
        userName = map[AppConstants.userNameField] as String,
        firstName = map[AppConstants.firstNameField] as String,
        lastName = map[AppConstants.lastNameField] as String;

  Map<String, Object?> tojson() => {
        AppConstants.emailField: email,
        AppConstants.userNameField: userName,
        AppConstants.firstNameField: firstName,
        AppConstants.lastNameField: lastName,
      };
}
