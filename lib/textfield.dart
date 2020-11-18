import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class textfield extends StatelessWidget {
  textfield({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(16.0, 58.0, 44.0, 16.0),
          size: Size(328.0, 74.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          fixedHeight: true,
          child:
              // Adobe XD layer: '✏️ Assistive text' (text)
              Text(
            'Inactive',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12,
              color: const Color(0x99ffffff),
              letterSpacing: 0.3999999847412109,
              height: 1.3333333333333333,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 328.0, 56.0),
          size: Size(328.0, 74.0),
          child:
              // Adobe XD layer: '🔲🎨 Container l Co…' (shape)
              Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(width: 1.0, color: const Color(0x61ffffff)),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(16.0, 17.0, 39.0, 21.0),
          size: Size(328.0, 74.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          fixedHeight: true,
          child:
              // Adobe XD layer: '✏️ Input text' (text)
              Text(
            'Label',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: const Color(0x99ffffff),
              letterSpacing: 0.15,
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(),
      ],
    );
  }
}
