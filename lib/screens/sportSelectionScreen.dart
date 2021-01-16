import 'dart:async';
import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:Sporten_in_de_buurt/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class sportSelectionScreen extends StatefulWidget {
  @override
  sportSelectionScreenState createState() => sportSelectionScreenState();
}

class sportSelectionScreenState extends State<sportSelectionScreen> {
  final ImageProvider youreawakeblur =
  const AssetImage('assets/images/heythereblur.jpg');
  final _formKey = GlobalKey<FormState>();

  List _myActivities;
  int sportLevelSettingsAmount = 0;

  Map mapped = Map<int, List>();
  var MappedList;

  get httpService => HttpService;
  @override
  void initState() {
    super.initState();
    _myActivities = [];
  }

  addRow(){
    setState(() {
      sportLevelSettingsAmount = sportLevelSettingsAmount + 1;
    });
  }
  setRows(int i){
    setState(() {
      sportLevelSettingsAmount = i;
    });
  }

  _saveForm() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        //
      });

    }
  }

  List<Widget> _sportLevels;

  Widget sportSelection(){
    _sportLevels = new List.generate(sportLevelSettingsAmount, (index) => new sportLevelWidget(_myActivities[index]));
    Map map = Map.fromIterable(_sportLevels, key: (k) => k, value: (v) => v);

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
                  "Activiteiten",
                  style: TextStyle(fontSize: 16),
                ),
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return 'Kies één of meerdere opties';
                  }
                  return null;
                },
                dataSource: [
                  {
                    "display": "Hardlopen",
                    "value": "Hardlopen",
                  },
                  {
                    "display": "Tennis",
                    "value": "tennis",
                  },
                  {
                    "display": "Voetbal",
                    "value": "Voetbal",
                  },
                  {
                    "display": "Basketbal",
                    "value": "Basketbal",
                  },
                  {
                    "display": "Softbal",
                    "value": "Softbal",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'Verder',
                cancelButtonLabel: 'Stop',
                hintWidget: Text('Kies minimaal één'),
                initialValue: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myActivities = value;
                    setRows(_myActivities.length);
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
              children: _sportLevels,
            ),
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(20.0),
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