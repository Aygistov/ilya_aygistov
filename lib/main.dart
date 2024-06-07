import 'package:flutter/material.dart';
import 'package:flutter_elijah/home.dart';
import 'package:flutter_elijah/theme.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  // ignore: prefer_const_constructors
  WidgetsFlutterBinding.ensureInitialized();
  /*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
*/
  // ignore: prefer_const_constructors
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilya Aygistov',
      theme: themeData(),
      home: const MyHomePage(title: 'Ilya Aygistov'),
    );
  }
}
