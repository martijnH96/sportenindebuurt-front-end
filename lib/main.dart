import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/EventForm.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (context) => homescreen(),
      },
    );
  }
}
