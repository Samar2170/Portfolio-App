import 'package:flutter/material.dart';
import 'package:portfolio_app/src/widgets/portfolio_nav_list.dart';

import '../data.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  
  // late TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //     length: 3,
  //     vsync: this
  //   )..addListener(_handleTabIndexChanged);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: TabBarView(
        children: [
          PortfolioNavList(navOptions: navOptions.where((navOption) => navOption.navCategory.category == 'portfolio').toList()),
        ],
      )
    );
  }
}

