import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'sportlist.dart';

void main() {
  runApp(MySportList());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
    );
  }
}
