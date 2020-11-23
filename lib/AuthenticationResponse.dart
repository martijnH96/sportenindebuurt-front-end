import 'Name.dart';

class AuthenticationResponse {

  final String id;
  final String username;
  final Name name;
  final String accessToken;

  AuthenticationResponse.fromJson(Map json):
    id = json["id"],
    username = json["username"],
    name = Name(
      first: json["firstName"],
      insertion: json["insertion"],
      last: json["lastName"]),
    accessToken = json["accessToken"];

}