import "package:flutter/foundation.dart";

import 'helpers/Maybe.dart';

class Name {

  final String first;
  final Maybe<String> insertion;
  final String last;

  const Name({
    @required this.first,
    this.insertion = const Maybe.nothing(),
    @required this.last}):
      assert(first != null),
      assert(last != null);

  String get full => insertion
    .map((insertion) => "$first $insertion $last")
    .or("$first $last");

  Map<String, dynamic> toMap() => {
    "first": first,
    "insertion": insertion.or(""),
    "last": last,
  };

}