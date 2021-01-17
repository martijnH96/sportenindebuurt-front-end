import 'dart:convert';
import 'package:Sporten_in_de_buurt/helpers/Maybe.dart';
import "package:http/http.dart" as http;
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HttpService{
  static final tokenStream = BehaviorSubject<Maybe<String>>.seeded(Maybe.nothing());
  Maybe<String> get _token => tokenStream.value;

  String get hostname {
    if (kIsWeb) {
      return 'http://localhost:8888';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080';
    } else {
      return 'http://localhost:8888';
    }
  }

  Future<http.Response> get(String url){
    return http.get(hostname + url, headers: getHeaders());
  }
  Future<http.Response> post(String url, Map body) async{
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
  })
      .or({HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"});
}