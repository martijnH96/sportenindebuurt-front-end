import 'package:flutter/material.dart';
import 'people.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: homescreen(),
//     );
//   }
// }


void main() {
  runApp(MaterialApp(
    title: 'People',
    theme: ThemeData(
      primaryColor: White,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
    },
  ));
}