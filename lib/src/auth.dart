import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
class PortfolioManagerAuth extends ChangeNotifier {
  bool _signedIn = false;
  bool get signedIn => _signedIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    var response = await http.post(Uri.parse('http://127.0.0.1:8000/portfolio/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'username': username, 'password': password})
    );
    if (response.statusCode != 200) {
      _signedIn = false;
      notifyListeners();
      return _signedIn;
    } else {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', token);
      final user = User.fromJson(data);
      print(user);
      localStorage.setInt('user_id', user.user_id);
      localStorage.setString('username', user.username);
      localStorage.setString('email', user.email);

      _signedIn = true;
      notifyListeners();
      return _signedIn;
    }
  }

  @override
  bool operator ==(Object other) { return other is PortfolioManagerAuth && other._signedIn == _signedIn; }

  @override
  int get hashCode => _signedIn.hashCode;
}

class PortfolioManagerAuthScope extends InheritedNotifier<PortfolioManagerAuth> {
  const PortfolioManagerAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  // static method returning PortfolioManagerAuth object, name of method is of and it takes BuildContext as argument
  // This method will be used to access the PortfolioManagerAuth object from the widget tree
  static PortfolioManagerAuth of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<PortfolioManagerAuthScope>()!
      .notifier!;
      // This line tries to retrieve the nearest ancestor widget of type PortfolioManagerAuthScope from the widget tree using the dependOnInheritedWidgetOfExactType method. This method will search up the widget tree hierarchy until it finds a matching widget or reaches the root of the tree.
}