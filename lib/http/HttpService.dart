import 'dart:convert';
import 'dart:typed_data';

import 'package:Sporten_in_de_buurt/helpers/Maybe.dart';
import "package:http/http.dart" as http;
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../AuthenticationService.dart';

class HttpService{

  Maybe<String> get _token => AuthenticationService.tokenStream.value;

  String get hostname {
    if (kIsWeb) {
      return 'http://localhost:8888';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080/';
    } else {
      return 'http://localhost:8888';
    }
  }

  Future<http.Response> get(String url){
    return http.get(hostname + url);
  }
  Future<http.Response> post(String url, Map<String, String> body) async{
    return http.post(hostname + url, headers: getHeaders(), body: jsonEncode(body));
  }
  Future<http.Response> put(String url, Map body){
    return http.put(hostname + url, headers: getHeaders(), body: jsonEncode(body));
  }
  Future<http.Response> patch(String url, Map body){
    return http.patch(hostname + url, headers: getHeaders(), body: jsonEncode(body));
  }
  Map getHeaders() => _token
      .map((token) => {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer $token"
  })
      .or({HttpHeaders.contentTypeHeader: "application/json"});
}