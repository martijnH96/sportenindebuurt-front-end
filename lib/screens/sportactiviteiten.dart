import 'dart:async';
import 'package:calendarro/calendarro.dart';
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
  List<String> startTimes = new List();
  List<String>  endTimes = new List();

  int starttime = 0;
  int endtime = 1;
  int available = 2;

  var maandag = [
      "00:00",
      "00:15",
    false
  ];
  var dinsdag = [
    "00:00",
    "00:15",
    false
  ];
  var woensdag = [
    "00:00",
    "00:15",
    false
  ];
  var donderdag = [
    "00:00",
    "00:15",
    false
  ];
  var vrijdag = [
    "00:00",
    "00:15",
    false
  ];
  var zaterdag = [
    "00:00",
    "00:15",
    false
  ];
  var zondag = [
    "00:00",
    "00:15",
    false
  ];

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    for(int i = 00; i < 24; i++){
      for(int j = 00; j < 4; j++){
        startTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
        endTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
      }
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
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Maandag: "),
                  DropdownButton<String>(

                      value: maandag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          maandag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: maandag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          maandag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: maandag[available],
                      onChanged: (bool checked){
                        setState(() {
                          maandag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dinsdag: "),
                  DropdownButton<String>(

                      value: dinsdag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dinsdag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: dinsdag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dinsdag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: dinsdag[available],
                      onChanged: (bool checked){
                        setState(() {
                          dinsdag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Woensdag: "),
                  DropdownButton<String>(

                      value: woensdag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          woensdag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: woensdag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          woensdag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: woensdag[available],
                      onChanged: (bool checked){
                        setState(() {
                          woensdag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Donderdag: "),
                  DropdownButton<String>(

                      value: donderdag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          donderdag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: donderdag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          donderdag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: donderdag[available],
                      onChanged: (bool checked){
                        setState(() {
                          donderdag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Vrijdag: "),
                  DropdownButton<String>(

                      value: vrijdag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          vrijdag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: vrijdag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          vrijdag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: vrijdag[available],
                      onChanged: (bool checked){
                        setState(() {
                          vrijdag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Zaterdag: "),
                  DropdownButton<String>(

                      value: zaterdag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          zaterdag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: zaterdag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          zaterdag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: zaterdag[available],
                      onChanged: (bool checked){
                        setState(() {
                          zaterdag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Zondag: "),
                  DropdownButton<String>(

                      value: zondag[starttime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          zondag[starttime] = newValue;
                        });
                      },
                      items: startTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Text("---"),
                  DropdownButton<String>(

                      value: zondag[endtime],
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          zondag[endtime] = newValue;
                        });
                      },
                      items: endTimes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  Checkbox(
                      value: zondag[available],
                      onChanged: (bool checked){
                        setState(() {
                          zondag[available] = checked;
                        });
                      }
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 33,
              child: RaisedButton(
                onPressed: () async{

                },
                child: Text("VOEG VOORKEUREN TOE"),
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
          SportenForm(),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
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