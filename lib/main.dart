import 'package:Sporten_in_de_buurt/screens/signupscreen.dart';
import 'package:Sporten_in_de_buurt/sport/sport_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homescreen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'screens/screen.dart';
import 'screens/timeframeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}//Home in zetten om nav bar te laten zien


class MyApp extends StatelessWidget{
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => homescreen(),
      },
    );
  }
}


//code hieronder is voor een navigatiemenu die op dit moment niet gebruikt word
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class NavObject {
  Widget screen;
  Icon navIcon;
  Text title;
  NavObject({this.screen, this.navIcon, this.title});
}

List<NavObject> navItems = [
  NavObject(
    screen: Screen(title: "Home"),
    navIcon: Icon(Icons.home),
    title: Text('Homepagina'),
  ),
  NavObject(
    screen: Screen(title: "Profiel pagina"),
    navIcon: Icon(Icons.settings),
    title: Text('Profiel pagina'),
  ),
  NavObject(
    screen: Screen(title: "open map"),
    navIcon: Icon(Icons.map_outlined),
    title: Text('Open map'),
  ),
  NavObject(
    screen: Screen(title: "open map"),
    navIcon: Icon(Icons.map_outlined),
    title: Text('Open map'),
  ),
];


class _HomeState extends State<Home> {
  int _screenNumber = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: navItems[_screenNumber].screen,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: navItems
              .map((navItem) => BottomNavigationBarItem(
            icon: navItem.navIcon,
            title: navItem.title,
          ))
              .toList(),
          currentIndex: _screenNumber,
          onTap: (i) => setState(() {
            _screenNumber = i;
          }),
        ),
      ),
    );
  }
}


/*
class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
    TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
    TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  ];

  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titled Bottom Bar"),
      ),

      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) => print("Selected Index: $index"),
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        activeColor: Colors.red,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}


 */