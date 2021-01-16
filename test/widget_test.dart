// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:Sporten_in_de_buurt/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
/*
  bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.shifting,
    key: Key("menu"),
    items: [
  BottomNavigationBarItem(
  icon: Icon(Icons.ac_unit, color: Colors.green,),
  title: InkWell(child:Text("test1", style: TextStyle(color: Colors.black),key:Key("First")),)
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.cast, color: Colors.yellow,),
  title:  InkWell(child:Text("test2", style: TextStyle(color: Colors.black),key:Key("Second")),)
  )
  ],
  ),


*/
/*  test(bottomnavigationbar test`, () async {
  await driver.waitFor(find.byValueKey("menu"));
  await driver.tap(find.byValueKey("test1"));
  print('geklikt op test1');
  await driver.tap(find.byValueKey("test2"));
  print('geklikt op test2');
  });

}

 */
