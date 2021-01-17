import 'dart:convert';
import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeSelectionScreen extends StatefulWidget {
  @override
  TimeSelectionScreenState createState() => TimeSelectionScreenState();
}

class TimeSelectionScreenState extends State<TimeSelectionScreen> {
  final ImageProvider firstSporterBlur =
      const AssetImage('assets/images/firstSporterBlur.jpg');
  final _formKey = GlobalKey<FormState>();
  int _dayAndTimeSettingsAmount = 0;
  final HttpService _httpService = HttpService();
  var sporterID;
  @override
  void initState() {
    super.initState();
  }
  Future<int> _getSessionsId() async {
    sporterID = await FlutterSession().get("sporterID");
    return sporterID;
  }

  addTimeFrameRow() {
    setState(() {
      _dayAndTimeSettingsAmount = _dayAndTimeSettingsAmount + 1;
    });
  }

  List<Widget> _timeFrames;

  Future<List<Widget>> _getTimesFromUser() async {
    List<Widget> userTimes;
    var _response = await _httpService.get("/time/"+sporterID.toString());
    var result = jsonDecode(_response.body);
    for(Map res in result){
      List resultSet = res.values.toList();
      userTimes.add(new TimeFrameWidget(resultSet[0], resultSet[1], resultSet[2]));
    }
    _dayAndTimeSettingsAmount = userTimes.length;
    _timeFrames = userTimes;
    return userTimes;
  }

  Widget _buildTimeFrameForm() {
    return FutureBuilder(
      future: _getTimesFromUser(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          _timeFrames = new List.generate(
              _dayAndTimeSettingsAmount, (index) => new TimeFrameWidget("00:00", "00:15", "Maandag"));
        }
        return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                new Container(
                  height: 400.0,
                  padding: EdgeInsets.all(16),
                  child: new ListView.builder(
                    itemCount: _timeFrames.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            _timeFrames.removeAt(index);
                            _dayAndTimeSettingsAmount = _timeFrames.length;
                          });
                        },
                        child: _timeFrames[index],
                      );
                    },
                  ),
                ),
                Container(
                    width: double.infinity,
                    alignment: AlignmentDirectional.topEnd,
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {
                          addTimeFrameRow();
                        },
                        child: Text("Voeg een rij toe + "),
                      ),
                    )),
                Builder(builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: SizedBox(
                      height: 33,
                      child: RaisedButton(
                        onPressed: () async {
                          final TimeFrameDTOList timeFrameList = TimeFrameDTOList(
                              List<TimeFrameDTO>.generate(_timeFrames.length,
                                      (index) {
                                    TimeFrameWidget widget = _timeFrames[index];
                                    final startTime = 0;
                                    final endTime = 1;
                                    final dayOfWeek = 2;
                                    return TimeFrameDTO(
                                        widget._timeSettings[startTime],
                                        widget._timeSettings[endTime],
                                        widget._timeSettings[dayOfWeek]);
                                  }));
                          final response = await _httpService.post(
                              "/pref/time/"+sporterID.toString(), timeFrameList.toJson());
                          if (response.statusCode == 200) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Times opgeslagen: " +
                                    jsonDecode(response.body)["beginTime"]),
                              ),
                            );
                            // }
                          }
                        },
                        child: Text("VOEG VOORKEUREN TOE"),
                      ),
                    ),
                  );
                })
              ],
            ));
      },
    );

  }

  Widget _buildTimeFrameContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Align(
          child: Text(
            'Tijdsvoorkeur instellingen',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        )
        ),
        _buildTimeFrameForm(),

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
      child:
      FutureBuilder(
          future: _getSessionsId(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return _buildTimeFrameContainer();
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

class TimeFrameWidget extends StatefulWidget {
  TimeFrameWidget(String beginTime, String endTime, String day){
    _timeSettings[0] = beginTime;
    _timeSettings[1] = endTime;
    _timeSettings[2] = day;
  }
  @override
  State<StatefulWidget> createState() => new TimeFrameWidgetState();
  var _timeSettings = ["00:00", "00:15", "Maandag"];
}

class TimeFrameWidgetState extends State<TimeFrameWidget> {
  void initState() {
    _setTimesForDropDown();
    this._timeSettings = widget._timeSettings;
  }

  var _timeSettings;

  final int STARTTIME = 0;
  final int ENDTIME = 1;
  final int DAY = 2;

  var _days = [
    "Maandag",
    "Dinsdag",
    "Woensdag",
    "Donderdag",
    "Vrijdag",
    "Zaterdag",
    "Zondag",
  ];

  List<String> _startTimes = new List();
  List<String> _endTimes = new List();

  _setTimesForDropDown() {
    for (int i = 00; i < 24; i++) {
      for (int j = 00; j < 4; j++) {
        _startTimes.add((i.toString().length == 1
                ? "0" + i.toString()
                : i.toString()) +
            ":" +
            ((j * 15).toString().length == 1
                ? j.toString() + "0"
                : (j * 15)
                    .toString())); //If the number is 1 digit, put a zero in front of it.
        _endTimes.add((i.toString().length == 1
                ? "0" + i.toString()
                : i.toString()) +
            ":" +
            ((j * 15).toString().length == 1
                ? j.toString() + "0"
                : (j * 15)
                    .toString())); //If the number is 1 digit, put a zero in front of it.

      }
    }
  }

  List<String> setEndTimeForDropDown(String beginTime) {
    List<String> _times = new List();
    var splitter = beginTime.split(":");
    for (int i = (int.parse(splitter[0]).round()); i < 24; i++) {
      for (int j = (int.parse(splitter[1]).round()); j < 60; j += 15) {
        _times.add((i.toString().length == 1
                ? "0" + i.toString()
                : i.toString()) +
            ":" +
            (j.toString().length == 1
                ? j.toString() + "0"
                : j.toString())); //Kijkt of het getal 1 cijfer is, zet een 0 voor het cijfer wanneer dit zo is.
      }
    }
    return _times;
  }

  Widget _buildTimeFrame() {
    widget._timeSettings = _timeSettings;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
              value: _timeSettings[DAY],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String dayValue) {
                setState(() {
                  _timeSettings[DAY] = dayValue;
                });
              },
              items: _days.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: _timeSettings[STARTTIME],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String startTimeValue) {
                setState(() {
                  _timeSettings[STARTTIME] = startTimeValue;
                  _endTimes = setEndTimeForDropDown(startTimeValue);
                  _timeSettings[ENDTIME] = _endTimes.first;
                });
              },
              items: _startTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: _timeSettings[ENDTIME],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String endTimeValue) {
                setState(() {
                  _timeSettings[ENDTIME] = endTimeValue;
                });
              },
              items: _endTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTimeFrame();
  }
}

class TimeFrameDTO {
  String beginTime;
  String endTime;
  String dayOfWeek;
  TimeFrameDTO(this.beginTime, this.endTime, this.dayOfWeek);
  Map<String, dynamic> toJson() => <String, dynamic>{
        "beginTime": beginTime,
        "endTime": endTime,
        "day": dayOfWeek,
      };
}

class TimeFrameDTOList {
  TimeFrameDTOList(this.timeFrameList);
  List<TimeFrameDTO> timeFrameList;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{"timeFrameDTOList": timeFrameList};
}
