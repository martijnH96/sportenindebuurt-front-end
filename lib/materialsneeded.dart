import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFF151026);
const White = const Color(0xffffffff);
const Black = const Color(0xFF000000);
const Purple = const Color(0xFFAB47BC);
final ImageProvider materialsneededimage =
const AssetImage('assets/images/materialsneeded.jpg');
Map<String, bool> List = {
  'Voetbal': false,
  'Goals': false,
  'Water': false,
};


class MyApp extends StatelessWidget {
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
          assert(false);
          return null;
        },
        title: 'Materialen nodig',
        theme: ThemeData(
          primaryColor: White,
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
      appBar: AppBar(
        title: Text('Materialen nodig',
          style: TextStyle(fontWeight: FontWeight.bold, color: Black),
      ),
      ),
      body: Container(
      decoration: BoxDecoration(
    image: DecorationImage(
    image: materialsneededimage,
    fit: BoxFit.cover,
    ),
    ),
    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: White, // background
                onPrimary: White, // foreground
              ),
              child: Text("Voetbal",
                style: TextStyle(fontWeight: FontWeight.bold, color: Black),
              ),
              onPressed: () {
                RemoveFromList removeFromList = new RemoveFromList();
                removeFromList.remove(List);
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
      backgroundColor: White,
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

class DynamicallyCheckboxState extends State {


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
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: materialsneededimage,
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
                style: TextStyle(fontWeight: FontWeight.bold, color: Black),
              ),
              value: List[key],
              activeColor: Purple,
              checkColor: White,
              onChanged: (bool value) {
                setState(() {
                  List[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    ],
    ),
    );
  }
}

class RemoveFromList {

  void remove(Map list) {
    list.removeWhere((key, value) => value == true);
  }
}