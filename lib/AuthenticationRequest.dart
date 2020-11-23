import "package:flutter/material.dart";

class AuthenticationRequest {

  final String username;
  final String password;

  AuthenticationRequest({@required this.username, @required this.password}):
    assert(username != null),
    assert(password != null);

  Map toMap() => { "username": username, "password": password };

}