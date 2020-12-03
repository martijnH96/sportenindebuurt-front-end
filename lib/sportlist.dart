import 'package:flutter/material.dart';

class MySportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == PassArgumentsScreen.routeName) {
            final ScreenArguments args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return PassArgumentsScreen(
                  title: args.title,
                  sport: args.sport,
                );
              },
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
        title: 'Navigation with Arguments',
        home: HomeScreen(),
        routes: {
          ExtractArgumentsScreen.routeName: (context) =>
              ExtractArgumentsScreen(),
        });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Voetbal"),
              onPressed: () {
                stop =0;
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Voetbal materialen',
                    'voetbal',
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Basketbal"),
              onPressed: () {
                stop =0;
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Basketbal materialen',
                    'basketbal',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.sport),
      ),
    );
  }
}

String geselecteerdeSport;

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String sport;
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.sport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    geselecteerdeSport = sport;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Center(
            child: DynamicallyCheckbox(),
          )
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String sport;

  ScreenArguments(this.title, this.sport);
}

class DynamicallyCheckbox extends StatefulWidget {
  @override
  DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
}

var stop =0;

class DynamicallyCheckboxState extends State {

  Map<String, bool> List;

  selecteerSport() {
    if (geselecteerdeSport == 'voetbal') {
      List = {
        'Voetbal': false,
        'Basketbal': false,
        'Honkbal': false,
      };
      stop =1;
    } else if(geselecteerdeSport == 'basketbal'){
      List = {
        'Voetba2l': false,
        'Basketb2al': false,
        'Honk2bal': false,
      };
      stop =1;
    }
  }

  var holder_1 = [];

  getItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    print(holder_1);
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    if(stop == 0){
      selecteerSport();
      stop =1;
    }
    // selecteerSport();
    return Column(children: <Widget>[
      Expanded(
        child:
        ListView(
          children: List.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  List[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
