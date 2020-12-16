import 'package:Sporten_in_de_buurt/screens/loginscreen.dart';
import 'package:Sporten_in_de_buurt/screens/preferenceScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homescreen.dart';
import 'screens/sportSelectionScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => PreferenceScreen(),
      },
    );
  }
}
