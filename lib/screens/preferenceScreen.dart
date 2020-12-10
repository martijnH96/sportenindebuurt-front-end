import 'package:Sporten_in_de_buurt/screens/timeframeScreen.dart';
import 'package:flutter/material.dart';

import 'sportSelectionScreen.dart';

class PreferenceScreen extends StatefulWidget {
  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  var youreawakeblur = const AssetImage('assets/images/heythereblur.jpg');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: youreawakeblur,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              onPressed: () => Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => sportSelectionScreen())),
          child: Text("Ga naar het selecteren van sporten"),),
          RaisedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => timeSelectionScreen())),
            child: Text("Ga naar het selecteren van tijd"),),
        ],
      ),
    );
  }
}