import 'dart:convert';

import 'package:Sporten_in_de_buurt/http/HttpService.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:http/http.dart" as http;
import './homescreen.dart';
import './signupscreen.dart';
import 'signupscreen.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final correctUsername = "martijn";
  final correctPassword = "martijn";
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
    Future<Album> futureAlbum;
    Future<http.Response> response;
    // futureAlbum = fetchAlbum();

    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(45.0, 285.0, 300.0, 74.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value) {
                if (value != 'martijn') {
                  return 'Vul a.u.b iets in';
                } else {
                  user = value;
                  return null;
                }
              },
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              initialValue: '',
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "Username",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(45.0, 385.0, 300.0, 74.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value) {
                if (value != 'martijn') {
                  return 'Vul a.u.b iets in';
                } else {
                  password = value;
                  return null;
                }
              },
              cursorColor: Theme.of(context).cursorColor,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              initialValue: '',
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "Password",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(45.0, 485.0, 300.0, 50.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:

            // Adobe XD layer: 'Login' (group)
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if (user == correctUsername &&
                      password == correctPassword) {
                    Map<String, String> login = {"user":user, "password":password};
                    final response = await httpService.post("login", login);
                    if(response.statusCode == 200){
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(jsonEncode(futureAlbum.toString())),
                        ),
                      );
                    }
                    // if(futureAlbum != null){
                    //
                    // }
                  }
                }
              },
              child:
                  Text("LOGIN"),
              )
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            bounds: Rect.fromLTWH(46.0, 139.0, 110.0, 48.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            // Adobe XD layer: 'Login title' (text)
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 40,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(23.1, 53.1, 18.4, 17.9),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            // Adobe XD layer: 'BackIcon' (shape)
            PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => homescreen(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ivg8a8,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 598.0, 375.0, 42.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'BottomBar' (group)
                GestureDetector(
              onTap: () => maakaccountaan?.call(),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => Signupscreen(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 42.0),
                      size: Size(375.0, 42.0),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'rectangle-17' (shape)
                          SvgPicture.string(
                        _svg_25w5dc,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(58.0, 13.0, 260.0, 35.0),
                      size: Size(375.0, 42.0),
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'Simon' (text)
                          Text(
                        'Geen account? Maak hier een account aan!',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(180.0, 452.0, 142.0, 16.0),
            size: Size(360.0, 640.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Forgot password' (text)
                Text(
              'Wachtwoord vergeten?',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 13,
                color: const Color(0xa6ffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          buildLoginForm(),

        ],
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

const String _svg_25w5dc =
    '<svg viewBox="0.0 625.0 375.0 42.0" ><path transform="translate(0.0, 625.0)" d="M 0 0 L 375 0 L 375 42 L 0 42 Z" fill="#2b2b2b" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_bcy0mj =
    '<svg viewBox="49.0 435.0 100.0 50.0" ><path transform="translate(49.0, 435.0)" d="M 10 0 L 90 0 C 95.52285003662109 0 100 4.477152347564697 100 10 L 100 40 C 100 45.52284622192383 95.52285003662109 50 90 50 L 10 50 C 4.477152347564697 50 0 45.52284622192383 0 40 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#2a4755" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_bob9d8 =
    '<svg viewBox="48.5 292.5 280.0 1.0" ><path transform="translate(48.5, 292.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ivg8a8 =
    '<svg viewBox="23.1 53.1 18.4 17.9" ><path transform="translate(18.72, 48.56)" d="M 12.39210033416748 21.9906005859375 L 5.064048767089844 14.66254901885986 C 4.674842834472656 14.4287748336792 4.41450023651123 14.00259399414063 4.41450023651123 13.51530075073242 C 4.41450023651123 13.38778114318848 4.432370662689209 13.2644739151001 4.465745449066162 13.1476526260376 C 4.516733169555664 12.90076446533203 4.637887477874756 12.66551303863525 4.829400062561035 12.47399997711182 L 12.39210033416748 4.911300182342529 C 12.91410064697266 4.389299869537354 13.76100063323975 4.389299869537354 14.28299999237061 4.911300182342529 C 14.80500030517578 5.433300018310547 14.80500030517578 6.279300212860107 14.28299999237061 6.802200317382813 L 8.906400680541992 12.17880058288574 L 21.51810073852539 12.17880058288574 C 22.25699996948242 12.17880058288574 22.85550117492676 12.77729988098145 22.85550117492676 13.51530075073242 C 22.85550117492676 14.25419998168945 22.25699996948242 14.85270023345947 21.51810073852539 14.85270023345947 L 9.03600025177002 14.85270023345947 L 14.28299999237061 20.09970092773438 C 14.80500030517578 20.62170028686523 14.80500030517578 21.46860122680664 14.28299999237061 21.9906005859375 C 14.02200031280518 22.25160026550293 13.67977523803711 22.38210105895996 13.33755016326904 22.38210105895996 C 12.99532508850098 22.38210105895996 12.65310001373291 22.25160026550293 12.39210033416748 21.9906005859375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_t77q38 =
    '<svg viewBox="48.5 384.5 280.0 1.0" ><path transform="translate(48.5, 384.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';


class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}