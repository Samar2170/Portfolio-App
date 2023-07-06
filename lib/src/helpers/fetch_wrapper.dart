import 'package:http/http.dart' as http;
import 'dart:convert';
class BaseRequest {
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic> body;
  final String method;

  BaseRequest({
    required this.url,
    required this.headers,
    required this.body,
    required this.method,
  });

  Future<http.Response> execute() {
    switch (method) {
      case 'GET':
        return http.get(Uri.parse(url), headers: headers);
      case 'POST':
        return http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
      case 'PUT':
        return http.put(Uri.parse(url), headers: headers, body: jsonEncode(body));
      case 'DELETE':
        return http.delete(Uri.parse(url), headers: headers);
      default:
        return http.get(Uri.parse(url), headers: headers);
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

