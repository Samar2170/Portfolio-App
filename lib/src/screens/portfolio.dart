import 'package:flutter/material.dart';
import 'package:portfolio_app/src/screens/holdings_screen.dart';
import '../routing.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this
    )..addListener(_handleTabIndexChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newPath = _routeState.route.pathTemplate;
    if (newPath.startsWith('/portfolio/holdings/')) {
      _tabController.index = 0;
    } else if (newPath.startsWith('/portfolio/snapshot/')) {
      _tabController.index = 2;
    } else {
      _tabController.index = 1;
    }
  }



  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChanged);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Holdings'),
            Tab(text: 'Agg Holdings'),
            Tab(text: 'Snapshot'),
          ],
        )
        ),
      body: 
          TabBarView(
            controller: _tabController,
            children:  const [
              HoldingsScreen(),
              Text('Agg Holdings'),
              Text('Snapshot')
            ]
          ),
      );
  }

  RouteState get _routeState => RouteStateScope.of(context);

  void _handleTabIndexChanged() {
    switch (_tabController.index) {
      case 1:
        _routeState.go('portfolio/agg_holdings/');
        break;
      case 2:
        _routeState.go('portfolio/snapshot/');
        break;
      case 0:
        _routeState.go('portfolio/holdings/');
        break;
      default:
        _routeState.go('portfolio/agg_holdings/');
        break;
    }
  }
}

