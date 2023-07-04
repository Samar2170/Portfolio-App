import 'package:flutter/material.dart';

class PortfolioManagerAuth extends ChangeNotifier {
  bool _signedIn = false;
  bool get signedIn => _signedIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Future is just a placeholder for actual api call to simulate async call
    // dummy method, here api call should be there to fetch token and then set it in shared preferences
    _signedIn = true;
    notifyListeners();
    return _signedIn;
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