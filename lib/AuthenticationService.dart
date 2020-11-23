import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'AuthenticationRequest.dart';
import 'AuthenticationResponse.dart';
import 'helpers/Maybe.dart';
import 'http/HttpService.dart';
import 'locator/LocatorService.dart';

class AuthenticationService {

  static const String AUTH_URL = "user/authenticate";
  static const String REGISTER_URL = "user/register";

  /// Expose the current authentication token through a stream,
  /// which will update whenever another token is inserted, or
  /// a `Maybe.nothing()` to signal no logged in user.
  static final tokenStream = BehaviorSubject<Maybe<String>>.seeded(Maybe.nothing());

  final HttpService _httpService = LocatorService.locate<HttpService>();

  // Future<Response> register(RegistrationRequest reg) =>
  //     _httpService.post(REGISTER_URL, reg.toMap());

  Future<AuthenticationResponse> authenticate(AuthenticationRequest authReq) =>
      _httpService.post(AUTH_URL, authReq.toMap()).then((res) {
        final AuthenticationResponse authRes = AuthenticationResponse.fromJson(jsonDecode(res.body));
        tokenStream.add(Maybe.from(authRes.accessToken));
        return authRes;
      });

  void logout() =>
      tokenStream.add(Maybe.nothing());

}