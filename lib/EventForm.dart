import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

void main() => runApp(EventForm());

class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

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
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textFormFields,
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
}

Widget submitButton = Container(
child: Text('Submit')
);

Widget textFormFields = Container(
  // welke textvelden hebben we nodig van de gebruiker?
  // welke sport, aantal mensen, locatie?, tijd: begin en eind?, speelniveau.

    child: Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFormTextFields("Sport"),
        _buildFormTextFields("Aantal deelnemers"),
        _buildFormTextFields("Locatie"),
        _buildFormTextFields("Begintijd"),
        _buildFormTextFields("Eindtijd"),
        _buildFormTextFields("Speelniveau"),
      ],
    )
);


Column _buildFormTextFields( String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
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
    ],
  );
}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Dropdown Formfield Example'),
    ),
    body: Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: DropDownFormField(
                titleText: 'My workout',
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
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(_myActivityResult),
            )
          ],
        ),
      ),
    ),
  );
}
}
