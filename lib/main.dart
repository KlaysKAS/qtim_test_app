import 'package:flutter/material.dart';
import 'package:qtim_test_app/locator.dart';

void main() {
  Locator.instance().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app for QTIM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Center(
        child: Text(
          'Test app for QTIM',
          style: TextStyle(decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
