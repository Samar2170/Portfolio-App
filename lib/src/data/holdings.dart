import 'dart:convert';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../helpers.dart';

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
    final uri = "${host}portfolio/get-holdings/";
    print(uri);
    final request = BaseRequest(
      url: uri, headers: {}, body: {}, method: 'GET');
    print(request);
    final response = await request.execute();
    print(response.body);
    if (response.statusCode  == 200) {
      final data = jsonDecode(response.body);
      print("data\n\n");
      print(data);
      final List<Holding> holdings = <Holding>[];
      for (final d in data['data']) {
        holdings.add(Holding.fromJson(d));
      }
      print(holdings);
      return holdings;
    } else {
      return [];
    }
}