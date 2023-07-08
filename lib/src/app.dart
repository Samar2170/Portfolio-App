import 'package:flutter/material.dart';
import 'auth.dart';
import 'routing.dart';
import 'screens/navigator.dart';
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
        '/portfolio',
        '/account',
        '/add',
      ],
      guard: _guard,
      initialRoute: '/portfolio',
    );

    _routeState = RouteState(_routeParser);
    _routerDelegate = SimpleRouterDelegate(
      routeState: _routeState,
      navigatorKey: _navigatorKey,
      builder: (context) => PortfolioMangerNavigator(
        navigatorKey: _navigatorKey,
      ),
    );

    _auth.addListener(_handleAuthStateChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RouteStateScope(notifier: _routeState, child: PortfolioManagerAuthScope(
      notifier: _auth,
      child: MaterialApp.router(
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeParser,
        theme: ThemeData(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
                  },
                ),
              ),
      ),
    ));
  }


  void _handleAuthStateChanged() {
    if (!_auth.signedIn) {
      _routeState.go('/signin');
    } 
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


