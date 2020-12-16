import 'dart:convert';

import 'package:Sporten_in_de_buurt/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../http/HttpService.dart';

class sportSelectionScreen extends StatefulWidget {
  @override
  sportSelectionScreenState createState() => sportSelectionScreenState();
}

class sportSelectionScreenState extends State<sportSelectionScreen> {
  final ImageProvider youreawakeblur =
      const AssetImage('assets/images/heythereblur.jpg');
  final _formKey = GlobalKey<FormState>();
  List _myActivities;
  List _sportsList;
  SportsListDTO sportsListDTO;
  final HttpService httpService = HttpService();
  Map _sportMap;

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _sportMap = {};
    for (String activity in _myActivities) {
      _sportMap.putIfAbsent(activity, () => new sportLevelWidget(activity));
    }
  }

  Future<void> _getSportsList() async {
    final _response = await httpService.get("/sports");
    _sportsList = jsonDecode(_response.body);
  }

  Widget _sportSelection() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
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
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text(
                  "My workouts",
                  style: TextStyle(fontSize: 16),
                ),
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return 'Please select one or more options';
                  }
                  return null;
                },
                dataSource: _sportsList,
                textField: 'sport',
                valueField: 'sport',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
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
                          string, () => new sportLevelWidget(string));
                    }
                    for (String string in difference) {
                      if (_sportMap.containsKey(string)) {
                        _sportMap.removeWhere((key, value) => key == string);
                      }
                    }
                    _myActivities = value;
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildEntireForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _sportSelection(),
        Container(
          height: 400.0,
          padding: EdgeInsets.all(16),
          child: new ListView(
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
                  final SportsListDTO sportDTOList = SportsListDTO(
                    List<SportsDTO>.generate(_sportMap.length, (index) {
                      sportLevelWidget _widget = _valueList[index];
                      return SportsDTO(
                          _widget.sportSettings[0], _widget.sportSettings[1]);
                    }),
                  );
                  final _response = await httpService.post(
                      "/pref/sports", sportDTOList.toJson());
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
    _getSportsList();
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: youreawakeblur,
          fit: BoxFit.cover,
        ),
      ),
      child: _buildEntireForm(),
    ));
  }
}

//Maakt een widget aan om voor elke sport een voorkeurs niveau in te stellen.
class sportLevelWidget extends StatefulWidget {
  sportLevelWidget(String name) {
    sportSettings[0] = name;
  }
  @override
  State<StatefulWidget> createState() => new sportLevelWidgetState();
  var sportSettings = [
    "",
    2.0,
  ];
}

class sportLevelWidgetState extends State<sportLevelWidget> {
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
  List<SportsDTO> sportsDTOList;
  SportsListDTO(this.sportsDTOList);
  Map<String, dynamic> toJson() => <String, dynamic>{
        "sportsListDTO": sportsDTOList,
      };
  Map<String, String> toShowList() {
    Map<String, String> mapped;
    for (SportsDTO sportDTO in sportsDTOList) {
      mapped.putIfAbsent("display", () => sportDTO.sport);
    }
    return mapped;
  }

  SportsListDTO.fromJson(Map json)
      : sportsDTOList = json.values.cast<SportsDTO>();
}
