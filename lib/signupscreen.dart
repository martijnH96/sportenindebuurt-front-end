import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './loginscreen.dart';
import 'package:adobe_xd/page_link.dart';
import './homescreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    this.youreawakeblur = const AssetImage('assets/images/heythereblur.jpg'),
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
                  pageBuilder: () => LoginFormState(
                    youreawakeblur:
                        const AssetImage('assets/images/heythereblur.jpg'),
                  ),
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
                    child:
                        // Adobe XD layer: 'rectangle-13' (shape)
                        SvgPicture.string(
                      _svg_1ngqdf,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
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
                  pageBuilder: () => homescreen(
                    // youreawake: const AssetImage('assets/images/heythere.jpg'),
                    // sport: 'Sporten in de \nbuurt',
                    // wit: const Color(0xffffffff),
                  ),
                ),
              ],
              child: SvgPicture.string(
                _svg_ivg8a8,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
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

const String _svg_1ngqdf =
    '<svg viewBox="49.0 574.0 100.0 50.0" ><path transform="translate(49.0, 574.0)" d="M 10 0 L 90 0 C 95.52285003662109 0 100 4.477152347564697 100 10 L 100 40 C 100 45.52284622192383 95.52285003662109 50 90 50 L 10 50 C 4.477152347564697 50 0 45.52284622192383 0 40 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#006ba1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2icd1w =
    '<svg viewBox="48.5 527.5 280.0 1.0" ><path transform="translate(48.5, 527.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wnxfkk =
    '<svg viewBox="48.5 435.5 280.0 1.0" ><path transform="translate(48.5, 435.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_87ljvw =
    '<svg viewBox="48.5 343.5 280.0 1.0" ><path transform="translate(48.5, 343.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lxzims =
    '<svg viewBox="48.5 251.5 280.0 1.0" ><path transform="translate(48.5, 251.5)" d="M 0 0 L 280 0" fill="none" fill-opacity="0.28" stroke="#ffffff" stroke-width="1" stroke-opacity="0.28" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ivg8a8 =
    '<svg viewBox="23.1 53.1 18.4 17.9" ><path transform="translate(18.72, 48.56)" d="M 12.39210033416748 21.9906005859375 L 5.064048767089844 14.66254901885986 C 4.674842834472656 14.4287748336792 4.41450023651123 14.00259399414063 4.41450023651123 13.51530075073242 C 4.41450023651123 13.38778114318848 4.432370662689209 13.2644739151001 4.465745449066162 13.1476526260376 C 4.516733169555664 12.90076446533203 4.637887477874756 12.66551303863525 4.829400062561035 12.47399997711182 L 12.39210033416748 4.911300182342529 C 12.91410064697266 4.389299869537354 13.76100063323975 4.389299869537354 14.28299999237061 4.911300182342529 C 14.80500030517578 5.433300018310547 14.80500030517578 6.279300212860107 14.28299999237061 6.802200317382813 L 8.906400680541992 12.17880058288574 L 21.51810073852539 12.17880058288574 C 22.25699996948242 12.17880058288574 22.85550117492676 12.77729988098145 22.85550117492676 13.51530075073242 C 22.85550117492676 14.25419998168945 22.25699996948242 14.85270023345947 21.51810073852539 14.85270023345947 L 9.03600025177002 14.85270023345947 L 14.28299999237061 20.09970092773438 C 14.80500030517578 20.62170028686523 14.80500030517578 21.46860122680664 14.28299999237061 21.9906005859375 C 14.02200031280518 22.25160026550293 13.67977523803711 22.38210105895996 13.33755016326904 22.38210105895996 C 12.99532508850098 22.38210105895996 12.65310001373291 22.25160026550293 12.39210033416748 21.9906005859375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
