import 'package:flutter/material.dart';
import 'auth.dart';
import 'routing.dart';

class PortfolioManager extends StatefulWidget {
  const PortfolioManager({super.key});

  @override
  State<PortfolioManager> createState() => _PortfolioManagerState();
}

class _PortfolioManagerState extends State<PortfolioManager> {
  final _auth = PortfolioManagerAuth();  
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final RouteState _routeState;
  late final SimpleRouterDelegate _routerDelegate;
  late final TemplateRouteParser _routeParser;


  @override
  void initState() {
    _routeParser = TemplateRouteParser(
      allowedPaths: [
        '/signin',
      ],
      guard: _guard,
      initialRoute: '/signin',
    );

    _routeState = RouteState(_routeParser);
    _routerDelegate = SimpleRouterDelegate(
      routeState: _routeState,
      navigatorKey: _navigatorKey,
      builder: (context) => Container(),
    );

    _auth.addListener(_handleAuthStateChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


  void _handleAuthStateChanged() {
    _routeState.go('/signin');
  }

  Future<ParsedRoute> _guard(ParsedRoute from) async {
    final signedIn = _auth.signedIn;
    final signInRoute = ParsedRoute('/signin', '/signin', {}, {});

    if (!signedIn && from != signInRoute) {
      return signInRoute;
    }
    else if (signedIn && from ==signInRoute) {
      return ParsedRoute('/portfolio','/portfolio',{}, {});
    }
    return from;

  }

  @override
  void dispose() {
    _auth.removeListener(_handleAuthStateChanged);
    _routeState.dispose();
    _routerDelegate.dispose();
    super.dispose();
  }
}


