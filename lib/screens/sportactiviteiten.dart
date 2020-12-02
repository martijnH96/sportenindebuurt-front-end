import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class sportactiviteiten extends StatefulWidget {
  @override
  sportactiviteitenState createState() => sportactiviteitenState();
}

class sportactiviteitenState extends State<sportactiviteiten> {
  String dropdownValue = 'One';
  final ImageProvider youreawakeblur =
  const AssetImage('assets/images/heythereblur.jpg');
  final _formKey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kHome = CameraPosition(
    target: LatLng(51.98475177056764, 5.913200119947337),
    zoom: 14.4746,
    tilt: 59.440717697143555,
  );
  static final CameraPosition _kSchool = CameraPosition(
    target: LatLng(51.989148239414384, 5.949366111923605),
    zoom: 14.4746,
    tilt: 59.440717697143555,
    // bearing: 192.8334901395799,
  );

  Future<void> _toSchool() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kSchool));
  }
  List _myActivities;
  String _myActivitiesResult;

  var pickedDate;

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
    pickedDate = DateTime.now();
  }

  _saveForm() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });

    }
  }

  Widget SportenForm(){
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: MultiSelectFormField(
                autovalidate: false,
                chipBackGroundColor: Colors.red,
                chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.red,
                checkBoxCheckColor: Colors.green,
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
                    _myActivities = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                child: Text('Save'),
                onPressed: _saveForm,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(_myActivitiesResult),
            ),

          ],
        )
    );
  }

  Widget buildotherForm(int i){
    return new Text(_myActivities[i]);
  }

  Widget buildDropDown() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SportenForm(),
          Expanded(
              child: new ListView.builder
                (
                  itemCount: _myActivities.length,

                  itemBuilder: (BuildContext ctxt, int Index) {
                    return new Container(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(_myActivities[Index]),
                            onTap: _pickDate,
                          ),
                        Text(pickedDate.toString())
                        ],
                      ),

                    );
                  }
              )
          ),
        ],
      );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year+1)
    );
    if(date != null){
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
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