import 'package:flutter/material.dart';

const White = const Color(0xffffffff);
const Black = const Color(0xFF000000);
final ImageProvider sportlijstimage =
const AssetImage('assets/images/peoplelist.jpg');
List<String> list = [
  'Henk',
  'Evelien',
  'Jet',
  'Jan',
  'Piet',
  'Jos'
];

class People extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'People',
      theme: ThemeData(
        primaryColor: White,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        title: Text('Personen',
          style: TextStyle(fontWeight: FontWeight.bold, color: Black),
        ),
      ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: sportlijstimage,
        fit: BoxFit.cover,
        ),
        ),
        child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: White, // background
            onPrimary: White, // foreground
          ),
          child: Text('Personen Lijst',
            style: TextStyle(fontWeight: FontWeight.bold, color: Black),
          ),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
        ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: White,
      appBar: AppBar(
        title: Text("Personen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Black),
        ),
      ),
        body: Container(
        decoration: BoxDecoration(
    image: DecorationImage(
    image: sportlijstimage,
    fit: BoxFit.cover,
    ),
    ),
    child: Center(
          child: new ListView.builder
            (
              itemCount: list.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return new ListTile(
                 leading: const Icon(Icons.account_circle_rounded),
                  title: Text((list[Index]),
                  style: TextStyle(fontWeight: FontWeight.bold, color: White),
                ),
                );
              }
              ),
      ),
        ),
    );
  }
}

