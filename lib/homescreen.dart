import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './loginscreen.dart';
import 'package:adobe_xd/page_link.dart';
import './signupscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loginscreen.dart';
import 'loginscreen.dart';
import 'signupscreen.dart';

class homescreen extends StatelessWidget {
  final ImageProvider youreawake;
  final VoidCallback login;
  final VoidCallback maakaccountaan;
  final String sport;
  final Color wit;
  homescreen({
    Key key,
    this.youreawake = const AssetImage('assets/images/heythere.jpg'),
    this.login,
    this.maakaccountaan,
    this.sport = 'Sporten in de \nbuurt',
    this.wit = const Color(0xffffffff),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
                  image: youreawake,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 526.0, 247.0, 50.0),
            size: Size(360.0, 640.0),
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Login' (group)
                GestureDetector(
              onTap: () => login?.call(),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => Loginscreen(
                    ),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 247.0, 50.0),
                      size: Size(247.0, 50.0),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'rectangle-13' (shape)
                          SvgPicture.string(
                        _svg_pk18kn,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(104.0, 17.0, 40.0, 16.0),
                      size: Size(247.0, 50.0),
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'Text' (text)
                          Text(
                        'LOGIN',
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
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(57.0, 458.0, 247.0, 50.0),
            size: Size(360.0, 640.0),
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Signup' (group)
                GestureDetector(
              onTap: () => maakaccountaan?.call(),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => Signupscreen(
                    ),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 247.0, 50.0),
                      size: Size(250.0, 50.0),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'rectangle-13' (shape)
                          SvgPicture.string(
                        _svg_tedd5l,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(50.0, 17.0, 139.0, 16.0),
                      size: Size(250.0, 50.0),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child:
                          // Adobe XD layer: 'Text' (text)
                          Text(
                        'MAAK ACCOUNT AAN',
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
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(65.5, 42.0, 240.0, 178.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              sport,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 36,
                color: wit,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_pk18kn =
    '<svg viewBox="64.0 591.0 247.0 50.0" ><path transform="translate(64.0, 591.0)" d="M 10 0 L 237 0 C 242.5228424072266 0 247 4.477152347564697 247 10 L 247 40 C 247 45.52284622192383 242.5228424072266 50 237 50 L 10 50 C 4.477152347564697 50 0 45.52284622192383 0 40 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#2a4755" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tedd5l =
    '<svg viewBox="64.0 526.0 247.0 50.0" ><path transform="translate(64.0, 526.0)" d="M 10 0 L 237 0 C 242.5228424072266 0 247 4.477152347564697 247 10 L 247 40 C 247 45.52284622192383 242.5228424072266 50 237 50 L 10 50 C 4.477152347564697 50 0 45.52284622192383 0 40 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#006ba1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
