import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/holdings_list.dart';


class HoldingsScreen extends StatefulWidget {
  const HoldingsScreen({super.key});

  @override
  State<HoldingsScreen> createState() => _HoldingsScreenState();
}

class _HoldingsScreenState extends State<HoldingsScreen> {
  final List<Holding> _holdings = [];

  void initState() {
    super.initState();
    getHoldings().then((value) => setState(() {
      _holdings.addAll(value);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return HoldingsList( 
      holdings: _holdings, 
    );
  }
}


