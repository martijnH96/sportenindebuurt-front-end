import 'dart:async';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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


  Widget SportenForm(){
    return new Scaffold(
        key: _formKey,
        body: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(-45.0, -17.0, 450.0, 675.0),
              size: Size(360.0, 640.0),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child:
              // Adobe XD layer: 'pexels-photo-126319' (shape)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: youreawakeblur,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(45.0, 585.0, 300.0, 50.0),
              size: Size(360.0, 640.0),
              pinLeft: true,
              fixedWidth: true,
              fixedHeight: true,
              child:
              RaisedButton(
                onPressed: _toSchool,
                child: Text(
                  'VOEG SPORTEN TOE\n',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 13,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(39.5, 160.0, 280.0, 59.5),
              size: Size(360.0, 640.0),
              pinLeft: true,
              fixedWidth: true,
              fixedHeight: true,
              child:
              // Adobe XD layer: 'sport' (group)
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Pinned.fromSize(
                bounds: Rect.fromLTWH(39.5, 260.0, 280.0, 300.5),
                size: Size(360.0, 640.0),
                child:
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kHome,
                  tiltGesturesEnabled: true,
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                  },
                )
            ),
            // Pinned.fromSize(
            //     bounds: Rect.fromLTWH(39.5, 160.0, 280.0, 59.5),
            //     size: Size(360.0, 640.0),
            //     child:
            //     GoogleMap(
            //       mapType: MapType.hybrid,
            //       initialCameraPosition: _kHome,
            //       onMapCreated: (GoogleMapController controller){
            //         _controller.complete(controller);
            //       },
            //     )
            // ),
          ],
        )
    );
  }

  // final items = List<timeItem>.generate(
  //   for(String item in _myActivities){
  //
  //   }
  //       ? timeItem(_myActivities[0]),
  // );

  List _myActivities;
  String _myActivitiesResult;

  Widget buildDropDown() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //
          //
          // Pinned.fromSize(
          //   bounds: Rect.fromLTWH(40.0, 75.0, 243.0, 72.0),
          //   size: Size(360.0, 640.0),
          //   pinLeft: true,
          //   fixedWidth: true,
          //   fixedHeight: true,
          //   child:
          //       // Adobe XD layer: 'Signup title' (text)
          //       Text(
          //     'Sporten selecteren\n',
          //     style: TextStyle(
          //       fontFamily: 'Lato',
          //       fontSize: 30,
          //       color: const Color(0xffffffff),
          //       fontWeight: FontWeight.w300,
          //     ),
          //     textAlign: TextAlign.left,
          //   ),
          // ),
          SportenForm(),
        ],
      ),
    );
  }

  // Widget buildTimeFrame(BuildContext context){
  //   return BasicDateTimeField();
  // }
  // Widget BasicDateTimeField(String string) {
  //   final format = DateFormat("yyyy-MM-dd HH:mm");
  //   return Column(children: <Widget>[
  //     // Text(Sport),
  //     Text('Basic date & time field (${format.pattern})'),
  //     DateTimeFieldeld(
  //       format: format,
  //       onShowPicker: (context, currentValue) async {
  //         final date = await showDatePicker(
  //             context: context,
  //             firstDate: DateTime(1900),
  //             initialDate: currentValue ?? DateTime.now(),
  //             lastDate: DateTime(2100));
  //         if (date != null) {
  //           final time = await showTimePicker(
  //             context: context,
  //             initialTime:
  //             TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
  //           );
  //           return DateTimeField.combine(date, time);
  //         } else {
  //           return currentValue;
  //         }
  //       },
  //     ),
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildDropDown();
  }
}
