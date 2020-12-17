import 'package:flutter/material.dart';

List<String> list = [
  'Henk',
  'Evelien',
  'Jet',
  'Jan',
  'Piet',
  'Jos'
];

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Personen Lijst'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personen"),
      ),
      body: Center(
          child: new ListView.builder
            (
              itemCount: list.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return new ListTile(
                 leading: const Icon(Icons.account_circle_rounded),
                  title: Text((list[Index])),
                );
              }
              ),
      )
    );
  }
}

