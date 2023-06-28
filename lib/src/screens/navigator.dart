import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
import '../routing.dart';
import '../screens/sign_in.dart';
import '../widgets/fade_transition_page.dart';

class BookstoreNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const BookstoreNavigator({
    required this.navigatorKey,
    super.key,
  });

  @override
  State<BookstoreNavigator> createState() => _BookstoreNavigatorState();
}

class _BookstoreNavigatorState extends State<BookstoreNavigator> {
  final _signInKey = const ValueKey('Sign in');
  final _scaffoldKey = const ValueKey('App scaffold');

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final authState = BookstoreAuthScope.of(context);
    final pathTemplate = routeState.route.pathTemplate;

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },
      pages: [
        if (routeState.route.pathTemplate == '/signin')
          FadeTransitionPage<void>(
            key: _signInKey,
            child: SignInScreen(
              onSignIn: (credentials) async {
                var signedIn = await authState.signIn(credentials.username, credentials.password);
                if (signedIn) {
                  await routeState.go('/');
                }
               }
            )
          )
      ],
    );
  }
}