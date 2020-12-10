import 'dart:convert';
import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:Sporten_in_de_buurt/screens/sportactiviteiten.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signupscreen.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final HttpService httpService = HttpService();
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final ImageProvider youreawakeblur;
  final VoidCallback maakaccountaan;
  final VoidCallback loginUser;
  final VoidCallback wachtwoordInput;
  final VoidCallback usernameInput;
  LoginFormState({
    this.youreawakeblur = const AssetImage('assets/images/heythereblur.jpg'),
    this.maakaccountaan,
    this.loginUser,
    this.wachtwoordInput,
    this.usernameInput,
  });

  String user;
  String password;

  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Vul a.u.b iets in';
              } else {
                user = value;
                return null;
              }
            },
            initialValue: '',
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              labelText: "Username",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Vul a.u.b iets in';
              } else {
                password = value;
                return null;
              }
            },
            obscureText: true,
            cursorColor: Theme.of(context).cursorColor,
            initialValue: '',
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              labelText: "Password",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signupscreen()));
              },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Wachtwoord vergeten?',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              )),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Bezig met inloggen"),
                    duration: Duration(seconds: 1),
                  ),
                );
                if (_formKey.currentState.validate()) {
                  if (!user.isEmpty && !password.isEmpty) {
                    Map<String, String> login = {
                      "user": user,
                      "password": password
                    };
                    final response = await httpService.post("login", login);
                    if (response.statusCode == 200) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Ingelogd op: " +
                              jsonDecode(response.body)["user"]),
                        ),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sportactiviteiten()));
                    }
                  }
                }
              },
              child: Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(25.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: youreawakeblur,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.max,children: [
            Expanded(
              child: Align(
                alignment: FractionalOffset.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
              )
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: buildLoginForm(),
              ),),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Signupscreen()));
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Geen account? Maak hier een account aan!',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            // ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}
