import 'dart:async';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
}

const String _svg_ghaxue =
    '<svg viewBox="49.0 574.0 280.0 50.0" ><path transform="translate(49.0, 574.0)" d="M 10 0 L 270 0 C 275.5228576660156 0 280 4.477152347564697 280 10 L 280 40 C 280 45.52284622192383 275.5228576660156 50 270 50 L 10 50 C 4.477152347564697 50 0 45.52284622192383 0 40 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#006ba1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b0bdkg =
    '<svg viewBox="39.5 219.5 280.0 1.0" ><path transform="translate(39.5, 219.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ilqzgz =
    '<svg viewBox="289.5 170.9 8.7 6.1" ><path transform="translate(289.5, 170.86)" d="M 0 0 L 8.67230224609375 6.070611476898193" fill="none" stroke="#606060" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_qdgvla =
    '<svg viewBox="289.5 164.5 8.7 6.4" ><path transform="translate(289.5, 164.5)" d="M 0 6.359688282012939 L 8.67230224609375 0" fill="none" stroke="#606060" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
