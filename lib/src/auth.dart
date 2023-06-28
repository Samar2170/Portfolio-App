import 'package:flutter/widgets.dart';

class BookstoreAuth extends ChangeNotifier {
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
  bool operator ==(Object other) {return other is BookstoreAuth && other._signedIn == _signedIn;}

  @override
  int get hashCode => _signedIn.hashCode;
}

class BookstoreAuthScope extends InheritedNotifier<BookstoreAuth> {
  const BookstoreAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static BookstoreAuth of(BuildContext context) => context
        .dependOnInheritedWidgetOfExactType<BookstoreAuthScope>()!
        .notifier!;
}