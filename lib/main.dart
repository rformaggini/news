import 'package:flutter/material.dart';
import 'package:news/app.dart';
import 'package:news/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const App());
}
