import 'package:flutter/material.dart';

import '../data.dart';


class HoldingsList extends StatefulWidget {
  final List<Holding> holdings;
  const HoldingsList({required this.holdings, super.key});  

  @override
  State<HoldingsList> createState() => _HoldingsListState();
}

class _HoldingsListState extends State<HoldingsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.holdings.length,
      itemBuilder: (context, index) => 
         Card(
          child: Row(
            children: [
              Text(widget.holdings[index].name),
              Text(widget.holdings[index].category),
              Text(widget.holdings[index].invested.toString()),
              Text(widget.holdings[index].currentValue.toString()),
              Text(widget.holdings[index].gain.toString()),
              Text(widget.holdings[index].gainpc.toString()),
            ],
          ),
        )
      );
  }
}