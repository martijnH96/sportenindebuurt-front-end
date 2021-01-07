import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFF151026);
const White = const Color(0xffffffff);
const Black = const Color(0xFF000000);
const Purple = const Color(0xFFAB47BC);
final ImageProvider sportlistimage =
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
          assert(false);
          return null;
        },
        title: 'Sport Lijst',
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
      backgroundColor: White,
      appBar: AppBar(
        title: Text('Sport Lijst',
          style: TextStyle(fontWeight: FontWeight.bold, color: Black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: sportlistimage,
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
                primary: White, // background
                onPrimary: White, // foreground
              ),
              child: Text("Basketbal",
                style: TextStyle(fontWeight: FontWeight.bold, color: Black),
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
      backgroundColor: White,
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
    // if(stop == 0){
      SelectSport selectSport = new SelectSport();
      selectSport.sportSelect(geselecteerdeSport);
      // selecteerSport();
    //   stop =1;
    // }
    // selecteerSport();
    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: sportlistimage,
      fit: BoxFit.cover,
    ),
    ),

        child: Column (children: <Widget>[
      Expanded(
        child:
        ListView(
          children: List.keys.map((String key) {
            return new ListTile(
              title: new Text(key,
                style: TextStyle(fontWeight: FontWeight.bold, color: White),
              ),
            );
          }).toList(),
        ),
      ),
    ]
        ),
    );
  }
}

Map<String, bool> List;

class SelectSport{

  Map sportSelect(String geselecteerdeSport) {
    if (geselecteerdeSport == 'voetbal') {
      List = {
        'Voetbal': false,
        'Goals': false,
        'Pionnen': false,
        'Hesjes': false,
      };
      return List;
      // stop =1;
    } else if(geselecteerdeSport == 'basketbal'){
      List = {
        'Basketbal': false,
        'Hesjes': false,
        'Netjes': false,
      };
      return List;
      // stop =1;
    } else {
      throw("No Sport Error");
    }
  }
}