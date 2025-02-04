import 'package:flutter/material.dart';
import 'package:malina_app/core/di/dependency_injection.dart';
import 'package:malina_app/features/home/presentation/screen/home_page.dart';

void main() {
  initDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
