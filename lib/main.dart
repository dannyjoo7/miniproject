import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/start_page/start_page.dart';
import 'main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
