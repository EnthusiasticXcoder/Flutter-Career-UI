import 'package:flutter/material.dart' show TextStyle, FontWeight, Colors, TextDecoration;

Map<String, TextStyle> tagStyles = {
  "h1": const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "h2": const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "h3": const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "h4": const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "h5": const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "h6": const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  "p": const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),
  "a": const TextStyle(
    fontSize: 14.0,
    color: Colors.blue, // Hyperlinks are usually blue
    decoration: TextDecoration.underline,
  ),
  "table": const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),
};