import 'package:flutter/material.dart';

class screen extends StatelessWidget {
  String title;
  screen({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title),
      ),
    );
  }
}