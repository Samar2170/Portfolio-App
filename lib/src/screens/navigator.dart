import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/src/auth.dart';
import 'package:portfolio_app/src/routing.dart';

class PortfolioMangerNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const PortfolioMangerNavigator({
    required this.navigatorKey,
    super.key,
  });

  @override
  State<PortfolioMangerNavigator> createState() => _PortfolioManagerNavigatorState();
}

class _PortfolioManagerNavigatorState extends State<PortfolioMangerNavigator> {
  final _signInKey = const ValueKey('Sign in');
  final _scaffoldKey = const ValueKey('App scaffold');
  final _bookDetailsKey = const ValueKey('Book details screen');
  final _authorDetailsKey = const ValueKey('Author details screen');

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final authState = PortfolioManagerAuthScope.of(context);
    final pathTemplate = routeState.route.pathTemplate;

    return Navigator();
  }

}
