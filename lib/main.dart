import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => homescreen(),
      },
    );
  }
}
