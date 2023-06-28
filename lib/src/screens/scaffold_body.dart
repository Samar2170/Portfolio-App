import 'package:flutter/material.dart';
import '../routing.dart';
import 'settings.dart';
import '../widgets/fade_transition_page.dart';


class BookstoreScaffoldBody extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const BookstoreScaffoldBody({super.key});

  @override
  Widget build(BuildContext context) {
    var currentRoute = RouteStateScope.of(context).route;

    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) => route.didPop(result),
      pages: [
        if (currentRoute.pathTemplate.startsWith('/settings'))
        const FadeTransitionPage<void>(
          key: ValueKey('settings'),
          child: SettingsScreen())

        else if (currentRoute.pathTemplate.startsWith('/'))
        FadeTransitionPage<void>(
          key: ValueKey('home'),
          child: Container(child: Text('Home')))
        else if (currentRoute.pathTemplate.startsWith('/signin'))
        FadeTransitionPage<void>(
          key: ValueKey('signin'),
          child: Container(child: Text('Sign in')))
      ],
     );
  }
}


