import 'package:flutter/cupertino.dart';

class UserDTO{
  final String id;
  final String username;
  final String name;

  UserDTO({@required this.id, @required this.username, @required this.name}):
        assert(id != null),
        assert(username != null),
        assert(name != null);

  toMap() => { "name": name };
}