import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Holding {
  String name;
  double invested;
  double currentValue;
  String category;
  double gain;
  double gainpc;

  Holding.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        invested = json['Invested'],
        currentValue = json['CurrentValue'],
        category = json['Category'],
        gain = json['Gain'],
        gainpc = json['Gainpc'];
}

class Response {
  bool status;
  String message;
  dynamic data;

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = json['data'];
}




Future<List<Holding>> getHoldings() async {
    await dotenv.load(fileName: ".env");
    final String? host = dotenv.env['HOST'];
    final response = await http.get(Uri.parse('{$host}portfolio/get-holdings/'));
    if (response.statusCode  == 200) {
      final data = jsonDecode(response.body);
      final holdings = data['data'].map((holding) => Holding.fromJson(holding)).toList();
      return holdings;
    } else {
      throw Exception('Failed to load holdings');
    }
}