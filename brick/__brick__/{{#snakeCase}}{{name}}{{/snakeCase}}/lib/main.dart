import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/app.dart';

void main() {
  Beamer.setPathUrlStrategy();
  runApp(const App());
}
