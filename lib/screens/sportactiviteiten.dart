import 'dart:async';
import 'package:calendarro/calendarro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class sportactiviteiten extends StatefulWidget {
  @override
  sportactiviteitenState createState() => sportactiviteitenState();
}

class sportactiviteitenState extends State<sportactiviteiten> {
  final ImageProvider youreawakeblur =
  const AssetImage('assets/images/heythereblur.jpg');
  final _formKey = GlobalKey<FormState>();

  List _myActivities;


  final int starttime = 0;
  final int endtime = 1;
  final int available = 2;
  final int day = 3;

  final ValueNotifier dayAndTimeSettings = ValueNotifier(0);

  var timeSettings = [
    "00:00",
    "00:15",
    false,
    "Maandag"
  ];

  Map mapped = Map<int, List>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    for(int i = 1; i <= dayAndTimeSettings.value; i++){
      mapped[i] = {i : timeSettings};
    }
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
                  // _saveForm();
                },
              ),
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, dynamic value, Widget child){
                return buildTimeFrame(value);
              },
              valueListenable: dayAndTimeSettings,
            ),
            RaisedButton(
                onPressed: () => dayAndTimeSettings.value++,
              child: Text("Meer!"),
            ),
            // buildTimeFrame(1),
            Builder(
                builder: (BuildContext context){
                  return Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: SizedBox(
                      height: 33,
                      child: RaisedButton(
                        onPressed: () async{
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(mapped.toString()),
                              // duration: Duration(seconds: 1),
                            ),
                          );

                        },
                        child: Text("VOEG VOORKEUREN TOE"),
                      ),
                    ),
                  );
                }
            )
          ],
        )
    );
  }


  Widget buildTimeFrame(int i){
    var days = [
      "Maandag",
      "Dinsdag",
      "Woensdag",
      "Donderdag",
      "Vrijdag",
      "Zaterdag",
      "Zondag",
    ];
    var daytimeSettings = mapped.values.elementAt(i);
    // var daytimeSettings = values[i];

    List<String> startTimes = new List();
    List<String> endTimes = new List();
    for(int i = 00; i < 24; i++){
      for(int j = 00; j < 4; j++){
        startTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
        endTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
      }
    }
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
              value: daytimeSettings[day],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  daytimeSettings[day] = newValue;
                });
              },
              items: days.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: daytimeSettings[starttime],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  daytimeSettings[starttime] = newValue;
                });
              },
              items: startTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: daytimeSettings[endtime],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  daytimeSettings[endtime] = newValue;
                });
              },
              items: endTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          // Checkbox(
          //     value: daytimeSettings[available],
          //     onChanged: (bool checked){
          //       setState(() {
          //         daytimeSettings[available] = checked;
          //       });
          //     }
          // ),
        ],
      ),
    );
  }

  Widget buildDropDown() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SportenForm(),
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

// Expanded(
//     child: ListView.builder
//       (
//         itemCount: _myActivities.length,
//         itemBuilder: (BuildContext context, int i) {
//           return new Container(
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Text(_myActivities[i]),
//                   // onTap: _pickDate,
//                 ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   RaisedButton(
//                       onPressed: (){
//                         showDatePicker(
//                             context: context,
//                             initialDate: pickedDates[i],
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime(DateTime.now().year+1)
//                         ).then((value) {
//                           setState(() {
//                             pickedDates[i] = value;
//                           });
//                         });
//                       }
//                   ),
//                 ],
//               ),
//               Text(pickedDates[i].toString())
//               ],
//             ),
//
//           );
//         }
//     )
// ),