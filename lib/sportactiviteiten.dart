import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class sportactiviteiten extends StatelessWidget {
  final ImageProvider youreawakeblur;
  final VoidCallback voegSportToe;
  final VoidCallback newSportInput;
  sportactiviteiten({
    Key key,
    this.youreawakeblur = const AssetImage('assets/images/heythereblur.jpg'),
    this.voegSportToe,
    this.newSportInput,
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
                  image: youreawakeblur,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(40.0, 544.0, 280.0, 50.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Signup button' (group)
                GestureDetector(
              onTap: () => voegSportToe?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 280.0, 50.0),
                    size: Size(280.0, 50.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'rectangle-13' (shape)
                        SvgPicture.string(
                      _svg_ghaxue,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(77.0, 17.0, 126.0, 32.0),
                    size: Size(280.0, 50.0),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Signup text' (text)
                        Text(
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
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(40.0, 75.0, 243.0, 72.0),
            size: Size(360.0, 640.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Signup title' (text)
                Text(
              'Sporten selecteren\n',
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
            bounds: Rect.fromLTWH(39.5, 160.0, 280.0, 59.5),
            size: Size(360.0, 640.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'sport' (group)
                GestureDetector(
              onTap: () => newSportInput?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.5, 0.0, 46.0, 34.0),
                    size: Size(280.0, 59.5),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Username field' (text)
                        Text(
                      'Sport 1\n',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.5, 33.0, 135.0, 17.0),
                    size: Size(280.0, 59.5),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Username placeholder' (text)
                        Text(
                      'ikwilsportenindebuurt',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: const Color(0xa6ffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 59.5, 280.0, 1.0),
                    size: Size(280.0, 59.5),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'line-7' (shape)
                        SvgPicture.string(
                      _svg_b0bdkg,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(298.4, 193.4, 8.7, 12.4),
            size: Size(360.0, 640.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Transform.rotate(
              angle: -1.5708,
              child:
                  // Adobe XD layer: 'cursor down' (group)
                  Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 6.4, 8.7, 6.1),
                    size: Size(8.7, 12.4),
                    pinLeft: true,
                    pinRight: true,
                    pinBottom: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Path 3384' (shape)
                        SvgPicture.string(
                      _svg_ilqzgz,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 8.7, 6.4),
                    size: Size(8.7, 12.4),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Path 3383' (shape)
                        SvgPicture.string(
                      _svg_qdgvla,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
