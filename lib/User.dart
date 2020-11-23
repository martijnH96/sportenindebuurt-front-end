import "package:flutter/material.dart";

import 'AuthenticationResponse.dart';
import 'Name.dart';

class User {

  final String id;
  final String username;
  final Name name;

  User.fromAuthenticationResponse(AuthenticationResponse authRes):
    id = authRes.id,
    username = authRes.username,
    name = authRes.name;

  User({@required this.id, @required this.username, @required this.name}):
    assert(id != null),
    assert(username != null),
    assert(name != null);

  toMap() => { "name": name };

}