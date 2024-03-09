import 'package:flutter/material.dart'
    show TextStyle, FontWeight, Colors, TextDecoration;

enum Tags { h1, h2, h3, h4, h5, h6, p, a, table }

Map<Tags, TextStyle> tagStyles = {
  Tags.h1: const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.h2: const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.h3: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.h4: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.h5: const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.h6: const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  Tags.p: const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),
  Tags.a: const TextStyle(
    fontSize: 14.0,
    color: Colors.blue, // Hyperlinks are usually blue
    decoration: TextDecoration.underline,
  ),
  Tags.table: const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),
};
