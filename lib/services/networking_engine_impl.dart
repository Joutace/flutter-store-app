import 'dart:convert';
import 'dart:developer';

import 'package:flutter_challange/services/preferences.dart';
import 'package:flutter_challange/shared/Environment.dart';
import 'package:flutter_challange/shared/HttpResponseExtensions.dart';
import 'package:http/http.dart' as http;

import '../di/app_providers.dart';
import 'networking_engine.dart';

class NetworkingEngineImpl implements NetworkingEngine {
  final env = getIt.get<Environment>();
  final preferences = getIt.get<Preferences>();

  Future<Map<String, String>> _getHeaders(Map<String, String> headers) async {
    final newHeaders = <String, String>{"Content-Type": "application/json"};
    //TODO: Add validation to recover correct user token
    final token = preferences.getUser();
    newHeaders['Authorization'] = token != null ? 'Bearer $token' : '';

    return newHeaders;
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url,
      required dynamic body,
      Map<String, String> headers = const {}}) async {
    var completeUrl = Uri.parse(env.baseUrl + url);

    final bodyEncoded = json.encode(body);

    final allHeaders = await _getHeaders(headers);

    final response =
        await http.post(completeUrl, headers: allHeaders, body: bodyEncoded);

    if (!response.isSuccess()) throw AppHttpException(response.body);

    final jsonBody = jsonDecode(response.body);

    return jsonBody;
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String url, Map<String, String> headers = const {}}) async {
    var completeUrl = Uri.parse(env.baseUrl + url);

    final allHeaders = await _getHeaders(headers);

    final response = await http.get(completeUrl, headers: allHeaders);

    if (!response.isSuccess()) throw AppHttpException(response.body);

    final jsonBody = jsonDecode(response.body);

    return jsonBody;
  }
}

class AppHttpException implements Exception {
  String message;

  AppHttpException(this.message);
}
