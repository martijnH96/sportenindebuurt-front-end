import 'dart:async';
import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class timeSelectionScreen extends StatefulWidget {
  @override
  timeSelectionScreenState createState() => timeSelectionScreenState();
}

class timeSelectionScreenState extends State<timeSelectionScreen> {
  final ImageProvider youreawakeblur =
  const AssetImage('assets/images/heythereblur.jpg');
  final _formKey = GlobalKey<FormState>();

  int dayAndTimeSettingsAmount = 1;

  Map mapped = Map<int, List>();
  var MappedList;

  get httpService => HttpService;
  @override
  void initState() {
    super.initState();
  }

  addTimeFrameRow(){
    setState(() {
      dayAndTimeSettingsAmount = dayAndTimeSettingsAmount + 1;
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

  List<Widget> _timeFrames;

  Widget SportenForm(){
    _timeFrames = new List.generate(dayAndTimeSettingsAmount, (index) => new timeFrameWidget());
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
                    onDismissed: (direction){
                      setState(() {
                        _timeFrames.removeAt(index);
                        dayAndTimeSettingsAmount = _timeFrames.length;
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
                  )
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
                          final response = await httpService.post("/time", _timeFrames);
                          for(timeFrameWidget widget in _timeFrames){
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(widget.timeSettings.toString()),
                              ),
                            );
                          }
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

  Widget buildDropDown() {
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
        SportenForm(),
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
class timeFrameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new timeFrameWidgetState();
  var timeSettings = [
    "00:00",
    "00:15",
    "Maandag"
  ];
}

class timeFrameWidgetState extends State<timeFrameWidget> {

  void initState(){
    for(int i = 00; i < 24; i++){
      for(int j = 00; j < 4; j++){
        startTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
        endTimes.add((i.toString().length == 1 ? "0"+i.toString() : i.toString()) + ":" + ((j*15).toString().length == 1 ? j.toString()+"0" : (j*15).toString()));
      }
    }
    this.timeSettings = widget.timeSettings;
  }
  var timeSettings;


  final int starttime = 0;
  final int endtime = 1;
  final int available = 2;
  final int day = 3;


  var days = [
    "Maandag",
    "Dinsdag",
    "Woensdag",
    "Donderdag",
    "Vrijdag",
    "Zaterdag",
    "Zondag",
  ];

  List<String> startTimes = new List();
  List<String> endTimes = new List();

  Widget buildings() {
    widget.timeSettings = timeSettings;
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
              value: timeSettings[day],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  timeSettings[day] = newValue;
                });
              },
              items: days.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: timeSettings[starttime],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  timeSettings[starttime] = newValue;
                });
              },
              items: startTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          DropdownButton<String>(
              value: timeSettings[endtime],
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  timeSettings[endtime] = newValue;
                });
              },
              items: endTimes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
          Container(
            height: 9,
            width: 20,
            child: Checkbox(
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: timeSettings[available],
                onChanged: (bool checked){
                  setState(() {
                    timeSettings[available] = checked;
                  });
                }
            ),
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