import 'package:flutter/material.dart';
import 'package:portfolio_app/src/auth.dart';
import 'package:portfolio_app/src/routing.dart';
import '../widgets/fade_transition.dart';
import 'sign_in.dart';
import 'scaffold.dart';
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

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final authState = PortfolioManagerAuthScope.of(context);
    // final pathTemplate = routeState.route.pathTemplate;

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },
      pages: [
          if (routeState.route.pathTemplate == '/signin')
          // Display the sign in screen.
          FadeTransitionPage<void>(
            key: _signInKey,
            child: SignInScreen(
              onSignIn: (credentials) async {
                var signedIn = await authState.signIn(
                    credentials.username, credentials.password);
                if (signedIn) {
                  await routeState.go('/portfolio');
                }
              },
            ),
          )
          else ...[
            FadeTransitionPage<void>(key: _scaffoldKey, 
              child: const PortfolioScaffold()),
          ]

      ],
    );
  }

}
