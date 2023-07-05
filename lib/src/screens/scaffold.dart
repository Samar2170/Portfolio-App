import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/src/screens/scaffold_body.dart';

import '../routing.dart';
class PortfolioScaffold extends StatelessWidget {
  const PortfolioScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);
    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: selectedIndex,
        body: const PortfolioScaffoldBody(),
        onDestinationSelected: (idx) {
          switch (idx) {
            case 0:
              routeState.go('/portfolio');
              break;
            case 1:
              routeState.go('/add');
              break;
            case 2:
              routeState.go('/account');
              break;
          }
        },
        destinations: const [
          AdaptiveScaffoldDestination(title: 'Portfolio', icon: Icons.book),
          AdaptiveScaffoldDestination(title: 'Add', icon: Icons.add),
          AdaptiveScaffoldDestination(title: 'Account', icon: Icons.account_circle),
        ],
      )
    );
  }



    int _getSelectedIndex(String pathTemplate) {
    if (pathTemplate.startsWith('/books')) return 0;
    if (pathTemplate == '/authors') return 1;
    if (pathTemplate == '/settings') return 2;
    return 0;
  }
}