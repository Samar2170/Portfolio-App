import 'package:flutter/material.dart';
import 'package:portfolio_app/src/routing.dart';
import 'package:portfolio_app/src/screens/portfolio.dart';
import 'package:portfolio_app/src/screens/add_list.dart';
import 'package:portfolio_app/src/widgets/fade_transition.dart';

class PortfolioScaffoldBody extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const PortfolioScaffoldBody({super.key});

  @override
  Widget build(BuildContext context) {
    var currentRoute = RouteStateScope.of(context).route;

    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },

      pages: [
        if (currentRoute.pathTemplate.startsWith('/portfolio'))
        const FadeTransitionPage(child: PortfolioScreen())
        else if (currentRoute.pathTemplate.startsWith('/add'))
        const FadeTransitionPage(child: AddListScreen())
        else if (currentRoute.pathTemplate.startsWith('/account'))
        FadeTransitionPage(child: Scaffold(
          body: Container(child:Text('Account')
          )
        ))
      ],
    );
  }
}


