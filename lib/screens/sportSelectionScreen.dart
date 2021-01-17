import 'dart:convert';
import 'package:Sporten_in_de_buurt/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../http/HttpService.dart';

class SportSelectionScreen extends StatefulWidget {
  @override
  SportSelectionScreenState createState() => SportSelectionScreenState();
}

class SportSelectionScreenState extends State<SportSelectionScreen> {
  final ImageProvider firstSporterBlur =
      const AssetImage('assets/images/firstSporterBlur.jpg');
  final _formKey = GlobalKey<FormState>();
  List _myActivities;
  final HttpService httpService = HttpService();
  Map _sportMap;
  var sporterID;
  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _sportMap = {};
  }

  //Gets all the available sports from the user through the back-end.
  Future<List> _getSportsFromUser() async {
    List _myActivities = [];
    var _response = await httpService.get("/sports/"+sporterID.toString());
    List result = jsonDecode(_response.body);
    for(Map res in result){
      List resultSet = res.values.toList();
      _myActivities.add(resultSet[0]);
      for (String activity in _myActivities) {
        _sportMap.putIfAbsent(activity, () => new SportLevelWidget(activity, resultSet[1]));
      }
    }
    return _myActivities;
  }

  //Gets the users ID from the session.
  Future<int> _getSessionsId() async {
    sporterID = await FlutterSession().get("sporterID");
    return sporterID;
  }

  //Gets all the available sports from the back-end
  Future<List> _getSportsList() async {
    var result;
    var _response = await httpService.get("/sports");
    result = jsonDecode(_response.body);
    return result;
  }


  //Builds the sport selection form with a multi select form.
  Widget _sportSelection() {
    return Container(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: _getSportsFromUser(),
                builder: (context, listFromUser){
                    return FutureBuilder(
                      future: _getSportsList(),
                      builder: (context, sportsList) {
                        if (sportsList.hasData) {
                          _myActivities = listFromUser.data;
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: MultiSelectFormField(
                              autovalidate: false,
                              fillColor: Colors.transparent,
                              chipBackGroundColor: Colors.green,
                              chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                              dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor: Colors.green,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                              title: Text(
                                "Gekozen sporten",
                                style: TextStyle(fontSize: 16),
                              ),
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Kies een of meerdere sporten.';
                                }
                                return null;
                              },
                              dataSource: sportsList.data,
                              textField: 'sport',
                              valueField: 'sport',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget: Text('Kies een of meerdere sporten'),
                              initialValue: _myActivities,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  List difference = _myActivities
                                      .toSet()
                                      .difference(value.toSet())
                                      .toList();
                                  for (String string in value) {
                                    _sportMap.putIfAbsent(
                                        string, () => new SportLevelWidget(string, 1.0));
                                  }
                                  for (String string in difference) {
                                    if (_sportMap.containsKey(string)) {
                                      _sportMap
                                          .removeWhere((key, value) => key == string);
                                    }
                                  }
                                  _myActivities = value;
                                });
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  }
            ),
          ],
        ));
  }

  //Builds entire form.
  Widget _buildEntireForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _sportSelection(),
        Container(
          height: 400.0,
          padding: EdgeInsets.all(16),
          child: new ListView(
            //Build widgets to adjust the desired level on the sport.
            children: _sportMap.entries.map<Widget>((entry) {
              entry.value.sportSettings[0] = entry.key;
              var w = entry.value;
              return w;
            }).toList(),
          ),
        ),
        Builder(builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: SizedBox(
              height: 33,
              child: RaisedButton(
                onPressed: () async {
                  var _valueList = _sportMap.values.toList();
                  SportsDTO sportsDTO;
                  final SportsListDTO sportsListDTO = SportsListDTO(
                    List<SportsDTO>.generate(_sportMap.length, (index) {
                      SportLevelWidget _widget = _valueList[index];
                      sportsDTO = new SportsDTO(
                          _widget.sportSettings[0], _widget.sportSettings[1]);
                      return sportsDTO;
                    }),
                  );
                  final _response = await httpService.post(
                      "/pref/sports/"+sporterID.toString(), sportsListDTO.toJson());
                  if (_response.statusCode == 200) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sport opgeslagen: " +
                            jsonDecode(_response.body)["sport"] +
                            " " +
                            jsonDecode(_response.body)['sportLevel']
                                .toString()),
                      ),
                    );
                  }
                },
                child: Text("VOEG VOORKEUREN TOE"),
              ),
            ),
          );
        }),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: firstSporterBlur,
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder(
          future: _getSessionsId(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return _buildEntireForm();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    ));
  }
}

//Widget creation for every sport selected in the multi-select widget.
class SportLevelWidget extends StatefulWidget {
  SportLevelWidget(String name, double sportLevel) {
    sportSettings[0] = name;
    sportSettings[1] = sportLevel;
  }
  @override
  State<StatefulWidget> createState() => new SportLevelWidgetState();
  var sportSettings = [
    "",
    1.0,
  ];
}

class SportLevelWidgetState extends State<SportLevelWidget> {
  void initState() {
    this.sportSettings = widget.sportSettings;
  }

  var sportSettings;
  final int SPORTNAME = 0;
  final int SPORTLEVEL = 1;

  Widget buildSportWidget() {
    widget.sportSettings = sportSettings;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(sportSettings[SPORTNAME])),
          Slider(
              value: sportSettings[SPORTLEVEL],
              activeColor: Colors.lightGreen,
              min: 1,
              max: 10,
              label: sportSettings[SPORTLEVEL].round().toString(),
              onChanged: (double levelValue) {
                setState(() {
                  sportSettings[SPORTLEVEL] = levelValue;
                });
              }),
          Align(
              alignment: Alignment.topCenter,
              child: Text(sportSettings[SPORTLEVEL].round().toString())),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSportWidget();
  }
}

class SportsDTO {
  String sport;
  double sportLevel;
  SportsDTO(this.sport, this.sportLevel);
  Map<String, dynamic> toJson() => <String, dynamic>{
        "sport": sport,
        "sportLevel": sportLevel,
      };
}

class SportsListDTO {
  List<SportsDTO> sportsList;
  SportsListDTO(this.sportsList);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{"sportsDTOList": sportsList};
}
