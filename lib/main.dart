import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/di/locator.dart';
import 'package:flutter_netflix_clone/router/app_router.dart';

import 'data/user.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  User? userSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Netflix Sans'),
      home: const AppRouter(),
    );
  }
}
