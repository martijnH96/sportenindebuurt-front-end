import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFF151026);
final ImageProvider youreawakeblur =
const AssetImage('assets/images/sportlist.jpg');

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
        theme: ThemeData(
          primaryColor: const Color(0xffffffff),
        ),
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
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Text('Sport Lijst',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: youreawakeblur,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text("Voetbal",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1)),
              ),
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
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text("Basketbal",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1)),
              ),
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
      backgroundColor: const Color(0xffffffff),
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
      backgroundColor: const Color(0xffffffff),
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
        'Goals': false,
        'Pionnen': false,
        'Hesjes': false,
      };
      stop =1;
    } else if(geselecteerdeSport == 'basketbal'){
      List = {
        'Basketbal': false,
        'Hesjes': false,
        'Netjes': false,
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
    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: youreawakeblur,
      fit: BoxFit.cover,
    ),
    ),

        child: Column (children: <Widget>[
      Expanded(
        child:
        ListView(
          children: List.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    ]
        ),

    );
  }
}
