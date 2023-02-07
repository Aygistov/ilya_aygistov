import 'package:flutter/material.dart';
import 'package:flutter_elijah/home.dart';
import 'package:flutter_elijah/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilya Aygistov',
      theme: themeData(),
      home: const MyHomePage(title: 'Ilya Aygistov'),
    );
  }
}
