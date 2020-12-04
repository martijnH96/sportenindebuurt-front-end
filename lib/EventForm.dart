import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

// void main() => runApp(EventForm()); is nutteloos :D

class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Event aanmaken';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        // welke textvelden hebben we nodig van de gebruiker?
        // welke sport, aantal mensen, locatie?, tijd: begin en eind?, speelniveau.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildDropDown(), //heb hem er hier maar effe in gedaan
          _buildFormTextFields("Aantal deelnemers"),
          _buildFormTextFields("Locatie"),
          _buildFormTextFields("Begintijd"),
          _buildFormTextFields("Eindtijd"),
          _buildFormTextFields("Speelniveau"),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: submitButton,

            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Vul iets in A.U.B.';
        }
        return null;
      },
    );
  }

  Widget submitButton = Container(
      child: Text('Submit')
  );

  Column _buildFormTextFields(String label) {
    return Column(
      mainAxisSize: MainAxisSize. min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        buildTextFormField(),
      ],
    );
  }
  var _myActivity; //deze staan lokaal - hier kan je dus niks mee in je code naast dat het een opvul plaats is. >>> zet deze buiten de functie
  String _myActivityResult; // dit ook - Het gaat niet veranderen wanneer je een andere item selecteert. >>>>>>>>>>>^^^^^^^^^^^^^^^^^^^^^^^^^^



  // Widget buildDropDown(BuildContext context) { //Wanneer wordt deze uberhaupt aangeroepen? Staat nergens in de code. - context hoeft ook niet per se mee
    Widget buildDropDown(){
    // var _myActivity; //deze staan lokaal - hier kan je dus niks mee in je code naast dat het een opvul plaats is. >>> zet deze buiten de functie
    // String _myActivityResult; // dit ook - Het gaat niet veranderen wanneer je een andere item selecteert. >>>>>>>>>>>^^^^^^^^^^^^^^^^^^^^^^^^^^
    // final formKey = new GlobalKey<FormState>(); //hoeft al niet - je hebt al een global key
    // return Column( 2x Column achter elkaar - is niet nodig aangezien hij al een Parent heeft van Form of iets.
    //   appBar: AppBar( //dit moet weg - je hebt al een AppBar met 'Event aanmaken'
      //   title: Text('Dropdown Formfield Example'),
      // ),
      // children: [
      //   Center(
      //   child: Form( hoeft niet nog een form te maken wanneer de widget al in een form staat
        //   key: _formKey,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: <Widget>[
              return Container( //ik zou gewoon een container terug sturen (hij staat al in een Column) - dan behoud hij gewoon de vormgeving van de andere objecten. Kan je natuurlijk veranderen, dat is aan jou
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Mijn sport',
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
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
                ),
              // ),
            // ],
          // ),
        // ),
      // ),
      // ],
    );
  }
}