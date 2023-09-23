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
        email = map[emailField] as String,
        userName = map[userNameField] as String,
        firstName = map[firstNameField] as String,
        lastName = map[lastNameField] as String;

  Map<String, Object?> tojson() => {
        emailField: email,
        userNameField: userName,
        firstNameField: firstName,
        lastNameField: lastName,
      };
}
