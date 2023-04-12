import 'package:cttns/app_module.dart';
import 'package:cttns/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  // runApp(const MyApp());
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
