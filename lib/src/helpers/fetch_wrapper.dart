import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BaseRequest {
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic> body;
  final String method;
  final token = '';

  BaseRequest({
    required this.url,
    required this.headers,
    required this.body,
    required this.method,
  });

  Future<Map<String,String>> modifyHeaders(Map<String, String> headers) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    headers['Authorization'] = 'Bearer ${localStorage.getString('token')}';
    return headers;
  }

  Future<http.Response> execute() async {
    final _headers = await modifyHeaders(headers);
    switch (method) {
      case 'GET':
        print(headers);
        return http.get(Uri.parse(url), headers: _headers);
      case 'POST':
        return http.post(Uri.parse(url), headers: _headers, body: jsonEncode(body));
      case 'PUT':
        return http.put(Uri.parse(url), headers: _headers, body: jsonEncode(body));
      case 'DELETE':
        return http.delete(Uri.parse(url), headers: _headers);
      default:
        return http.get(Uri.parse(url), headers: _headers);
    }
  }
}

class BaseResponse {
  final bool status;
  final String message;
  final dynamic data;

  BaseResponse({
    required this.status,
    required this.message,
    required this.data,
  });
}

