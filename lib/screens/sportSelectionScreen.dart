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

  get httpService => HttpService;
  @override
  void initState() {
    super.initState();
    _myActivities = [];
    sportMap = {};
    for(String string in _myActivities){
      sportMap.putIfAbsent(string, () => new sportLevelWidget(string));
    }
  }

  Map sportMap;
  Widget sportSelection(){
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
                dataSource: [
                  {
                    "display": "Running",
                    "value": "Running",
                  },
                  {
                    "display": "Climbing",
                    "value": "Climbing",
                  },
                  {
                    "display": "Walking",
                    "value": "Walking",
                  },
                  {
                    "display": "Swimming",
                    "value": "Swimming",
                  },
                  {
                    "display": "Soccer Practice",
                    "value": "Soccer Practice",
                  },
                  {
                    "display": "Baseball Practice",
                    "value": "Baseball Practice",
                  },
                  {
                    "display": "Football Practice",
                    "value": "Football Practice",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                initialValue: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    List difference = _myActivities.toSet().difference(value.toSet()).toList();
                    for(String string in value){
                      if(!sportMap.containsKey(string)){
                        sportMap.putIfAbsent(string, () => new sportLevelWidget(string));
                      }
                    }
                    for(String string in difference){
                      if(sportMap.containsKey(string)){
                        sportMap.removeWhere((key, value) => key == string);
                      }
                    }
                    _myActivities = value;
                  });
                  // _saveForm();
                },
              ),
            ),
          ],
        )
    );
  }

  Widget buildDropDown() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          sportSelection(),
          Container(
            height: 400.0,
            padding: EdgeInsets.all(16),
            child: new ListView(
              children: sportMap.entries.map<Widget>((entry){
                var w = entry.value;
                return w;
                // return w != null ? w : null;
              }).toList(),
            ),
          ),
          Builder(
              builder: (BuildContext context){
                return Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: SizedBox(
                    height: 33,
                    child: RaisedButton(
                      onPressed: () async{
                        final response = await httpService.post("/sport", sportMap);
                        // for(timeFrameWidget widget in _timeFrames){
                        //   Scaffold.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(widget.timeSettings.toString()),
                        //     ),
                        //   );
                        // }
                      },
                      child: Text("VOEG VOORKEUREN TOE"),
                    ),
                  ),
                );
              }
          )
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
            image: youreawakeblur,
            fit: BoxFit.cover,
          ),
        ),
        child: buildDropDown(),
      )
    );
  }
}
class sportLevelWidget extends StatefulWidget {
  sportLevelWidget(String name){
    sportSettings[1] = name;
  }
  @override
  State<StatefulWidget> createState() => new sportLevelWidgetState();
  var sportSettings = [
    2.0,
    "",
  ];
}

class sportLevelWidgetState extends State<sportLevelWidget> {

  void initState(){
    this.sportSettings = widget.sportSettings;
  }
  var sportSettings;
  final int sportLevel = 0;
  final int sportName = 1;

  Widget buildings() {
    widget.sportSettings = sportSettings;
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(sportSettings[sportName])
          ),
          Slider(
              value: sportSettings[sportLevel],
              min: 1,
              max: 10,
              label: sportSettings[sportLevel].round().toString(),
              onChanged: (double value){
                setState(() {
                  sportSettings[sportLevel] = value;
                });
              }
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(sportSettings[sportLevel].round().toString())
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return buildings();
  }

}

// Completer<GoogleMapController> _controller = Completer();
// static final CameraPosition _kHome = CameraPosition(
//   target: LatLng(51.98475177056764, 5.913200119947337),
//   zoom: 14.4746,
//   tilt: 59.440717697143555,
// );
// static final CameraPosition _kSchool = CameraPosition(
//   target: LatLng(51.989148239414384, 5.949366111923605),
//   zoom: 14.4746,
//   tilt: 59.440717697143555,
//   // bearing: 192.8334901395799,
// );
//
// Future<void> _toSchool() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kSchool));
// }