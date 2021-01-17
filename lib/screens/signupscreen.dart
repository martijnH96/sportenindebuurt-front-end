import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'loginscreen.dart';
import 'package:adobe_xd/page_link.dart';
import 'homescreen.dart';

class Signupscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupForm(),
    );
  }
}


class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final ImageProvider youreawakeblur;
  final VoidCallback newWachtwoordInput;
  final VoidCallback newEmailInput;
  final VoidCallback newLeeftijdInput;
  final VoidCallback newUsernameInput;

  String username;
  String password;
  String email;
  String leeftijd;

  SignupFormState({
    this.youreawakeblur = const AssetImage('assets/images/firstSporterBlur.jpg'),
    this.newWachtwoordInput,
    this.newEmailInput,
    this.newLeeftijdInput,
    this.newUsernameInput,
  });
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    loginController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-45.0, -17.0, 450.0, 675.0),
            size: Size(360.0, 640.0),
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
            bounds: Rect.fromLTWH(249.0, 559.0, 75.0, 16.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Already a member' (text)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginForm(),
                ),
              ],
              child: Text(
                'Ben je al lid?',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 13,
                  color: const Color(0xa6ffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(40.0, 542.0, 100.0, 50.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            FloatingActionButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  Scaffold
                      .of(context)
                      .showSnackBar(SnackBar(content: Text(username + " " + leeftijd + " " + email + " " + password),),);
                }
              },
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 100.0, 50.0),
                    size: Size(100.0, 50.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(15.0, 17.0, 82.0, 20.0),
                    size: Size(110.0, 50.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Signup text' (text)
                    Text(
                      'MAAK AAN',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(39.5, 436.0, 310.0, 75.5),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Vul a.u.b iets in';









                  //    password
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
              maxLength: 20,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "Wachtwoord",
                alignLabelWithHint: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff111111)),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(39.5, 344.0, 310.0, 75.5),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Vul a.u.b iets in';









                  //    email
                } else {
                  email = value;
                  return null;
                }
              },
              cursorColor: Theme.of(context).cursorColor,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              initialValue: '',
              maxLength: 20,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "E-mailadres",
                alignLabelWithHint: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff111111)),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(39.5, 252.0, 310.0, 75.5),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value){
                if(value.isEmpty || double.parse(value, (e) => null) != null){
                  return 'Vul a.u.b iets in';









                  //          leeftijd
                } else {
                  leeftijd = value;
                  return null;
                }
              },
              cursorColor: Theme.of(context).cursorColor,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              initialValue: '',
              maxLength: 20,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "Leeftijd",
                alignLabelWithHint: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff111111)),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(39.5, 170.0, 310.0, 75.5),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Vul a.u.b iets in';









                  //      username
                } else {
                  username = value;
                  return null;
                }
              },
              cursorColor: Theme.of(context).cursorColor,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
              initialValue: '',
              maxLength: 20,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                ),
                labelText: "Username",
                alignLabelWithHint: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff111111)),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(40.0, 92.0, 305.0, 36.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Signup title' (text)
                Text(
              'Account aanmaken',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30,
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
            pinTop: true,
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
                  pageBuilder: () => Homescreen(
                    // youreawake: const AssetImage('assets/images/heythere.jpg'),
                    // sport: 'Sporten in de \nbuurt',
                    // wit: const Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SignupForm extends StatefulWidget{
  @override
  SignupFormState createState(){
    return SignupFormState();
  }
}